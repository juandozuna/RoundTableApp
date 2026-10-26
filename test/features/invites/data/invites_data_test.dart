import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/features/invites/data/client/invite_directory_client.dart';
import 'package:gold_roundtables/features/invites/data/client/invites_client.dart';
import 'package:gold_roundtables/features/invites/data/datasources/invite_directory_remote_data_source.dart';
import 'package:gold_roundtables/features/invites/data/datasources/invites_remote_data_source.dart';
import 'package:gold_roundtables/features/invites/data/services/invite_attempts_service_impl.dart';
import 'package:gold_roundtables/features/invites/data/services/invite_directory_service_impl.dart';
import 'package:gold_roundtables/features/invites/data/services/invite_failure_mapper.dart';
import 'package:gold_roundtables/features/invites/data/services/invite_service_impl.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_problem.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_role_kind.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_scope.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_status.dart';
import 'package:gold_roundtables/features/invites/domain/models/new_invite.dart';
import 'package:gold_roundtables/features/invites/domain/models/person_draft.dart';
import 'package:gold_roundtables/features/invites/domain/models/redeem_profile.dart';
import 'package:gold_roundtables/features/invites/domain/services/invite_attempts_service.dart';
import 'package:gold_roundtables/features/invites/domain/use_cases/redeem/preview_invite_use_case.dart';

import '../domain/invite_models_json_test.dart' show inviteJson;
import '../helpers/fakes.dart';

class RecordingAdapter implements HttpClientAdapter {
  RecordingAdapter(this.respond);

  final (int, Object) Function(RequestOptions options) respond;
  final List<RequestOptions> requests = [];
  final List<String> bodies = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final body = requestStream == null
        ? ''
        : utf8.decode(
            (await requestStream.toList()).expand((chunk) => chunk).toList(),
          );
    bodies.add(body);
    final (status, payload) = respond(options);
    return ResponseBody.fromString(
      jsonEncode(payload),
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

InviteServiceImpl serviceOver(RecordingAdapter adapter) {
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost/functions/v1'))
    ..httpClientAdapter = adapter;
  return InviteServiceImpl(InvitesRemoteDataSource(InvitesClient(dio)));
}

Map<String, Object?> apiError(String code) => {
  'error': {'code': code, 'message': 'x'},
};

void main() {
  group('InviteServiceImpl', () {
    test('previews with GET /invites/preview?code=', () async {
      final adapter = RecordingAdapter(
        (_) => (
          200,
          {
            'invite': {
              'code': 'MESA34',
              'status': 'pending',
              'role_kind': 'member',
              'organization_name': 'Fundación Luz',
              'person_first_name': 'Rodrigo',
              'expires_at': '2026-11-08T12:00:00+00:00',
            },
          },
        ),
      );
      final preview = await serviceOver(adapter).preview('MESA34');

      expect(preview.personFirstName, 'Rodrigo');
      expect(adapter.requests.single.method, 'GET');
      expect(adapter.requests.single.path, '/invites/preview');
      expect(adapter.requests.single.queryParameters, {'code': 'MESA34'});
    });

    test(
      'redeems with the code and only the confirmed profile fields',
      () async {
        final adapter = RecordingAdapter(
          (_) => (
            200,
            {
              'already_redeemed': false,
              'person': inviteJson['person'],
              'invite': inviteJson,
              'contexts': <Object>[],
            },
          ),
        );
        final result = await serviceOver(adapter).redeem(
          'MESA34',
          const RedeemProfile(firstName: 'Rodrigo', phone: '+18095550101'),
        );

        expect(result.person.firstName, 'Rodrigo');
        expect(adapter.requests.single.path, '/invites/redeem');
        expect(jsonDecode(adapter.bodies.single), {
          'code': 'MESA34',
          'profile': {'first_name': 'Rodrigo', 'phone': '+18095550101'},
        });
      },
    );

    test('creates, lists with scope filters, revokes and renews', () async {
      final adapter = RecordingAdapter((options) {
        if (options.method == 'GET') {
          return (
            200,
            {
              'invites': [inviteJson],
            },
          );
        }
        return (
          options.path.endsWith('/renew') ? 200 : 201,
          {'invite': inviteJson},
        );
      });
      final service = serviceOver(adapter);

      await service.create(
        const NewInvite(
          roleKind: InviteRoleKind.member,
          roundTableId: 't-1',
          person: PersonDraft(firstName: 'Rodrigo', lastName: 'Paz'),
        ),
      );
      final list = await service.list(
        const InviteScope(roundTableId: 't-1'),
        status: InviteStatus.pending,
      );
      await service.revoke('inv-1');
      await service.renew('inv-1', expiresInDays: 7);

      expect(list, hasLength(1));
      expect(
        jsonDecode(adapter.bodies[0]),
        containsPair('role_kind', 'member'),
      );
      expect(adapter.requests[1].queryParameters, {
        'round_table_id': 't-1',
        'status': 'pending',
      });
      expect(adapter.requests[2].path, '/invites/inv-1/revoke');
      expect(adapter.requests[3].path, '/invites/inv-1/renew');
      expect(jsonDecode(adapter.bodies[3]), {'expires_in_days': 7});
    });

    test('turns server error codes into explainable problems', () async {
      final cases = {
        (404, 'invite_not_found'): InviteProblem.notFound,
        (410, 'invite_expired'): InviteProblem.expired,
        (410, 'invite_revoked'): InviteProblem.revoked,
        (409, 'invite_already_used'): InviteProblem.alreadyUsed,
        (409, 'person_linked_elsewhere'): InviteProblem.linkedElsewhere,
        (409, 'identity_linked_elsewhere'):
            InviteProblem.identityLinkedElsewhere,
        (409, 'table_full'): InviteProblem.tableFull,
        (409, 'invite_pending_exists'): InviteProblem.pendingExists,
        (403, 'forbidden'): InviteProblem.forbidden,
        (422, 'validation_failed'): InviteProblem.validation,
      };
      for (final entry in cases.entries) {
        final (status, code) = entry.key;
        final service = serviceOver(
          RecordingAdapter((_) => (status, apiError(code))),
        );
        await expectLater(
          service.preview('MESA34'),
          throwsA(
            isA<InviteFailure>().having((f) => f.problem, code, entry.value),
          ),
        );
      }
    });

    test('network trouble reads as offline', () {
      const error = ApiException(kind: ApiErrorKind.network);
      expect(InviteFailureMapper.fromApi(error).problem, InviteProblem.offline);
    });
  });

  group('directory', () {
    test('reads tables and organizations with PostgREST filters', () async {
      final adapter = RecordingAdapter((options) {
        if (options.path == '/admin_tables') {
          return (
            200,
            [
              {
                'id': 't-1',
                'organization_id': 'org-luz',
                'name': 'Mesa Esperanza 03',
                'active_people': 8,
                'max_people': 9,
              },
            ],
          );
        }
        return (
          200,
          [
            {'id': 'org-luz', 'name': 'Fundación Luz'},
          ],
        );
      });
      final dio = Dio(BaseOptions(baseUrl: 'http://localhost/rest/v1'))
        ..httpClientAdapter = adapter;
      final service = InviteDirectoryServiceImpl(
        InviteDirectoryRemoteDataSource(InviteDirectoryClient(dio)),
      );

      final tables = await service.tables(organizationId: 'org-luz');
      final orgs = await service.organizations();

      expect(tables.single.freeSeats, 1);
      expect(orgs.single.name, 'Fundación Luz');
      expect(
        adapter.requests[0].queryParameters['organization_id'],
        'eq.org-luz',
      );
      expect(adapter.requests[0].queryParameters.containsKey('id'), isFalse);
      expect(adapter.requests[1].queryParameters['status'], 'eq.active');
    });
  });

  group('typed code lock', () {
    late FixedClock clock;
    late InviteAttemptsServiceImpl attempts;
    late FakeInviteService invites;
    late PreviewInviteUseCase preview;

    setUp(() {
      clock = FixedClock(DateTime.utc(2026, 10, 25, 12));
      attempts = InviteAttemptsServiceImpl(clock);
      invites = FakeInviteService();
      preview = PreviewInviteUseCase(invites, attempts, clock);
      invites.previewFailures['BAD234'] = const InviteFailure(
        InviteProblem.notFound,
      );
    });

    Future<InviteProblem?> typeBad() async {
      try {
        await preview('BAD234', typed: true);
        return null;
      } on InviteFailure catch (failure) {
        return failure.problem;
      }
    }

    test('the fifth wrong code locks typing for a minute', () async {
      for (var i = 0; i < 4; i++) {
        expect(await typeBad(), InviteProblem.notFound);
      }
      expect(attempts.remainingAttempts, 1);
      expect(await typeBad(), InviteProblem.lockedOut);
      expect(await typeBad(), InviteProblem.lockedOut);
      expect(invites.calls.where((c) => c.startsWith('preview')), hasLength(5));

      clock.now = clock.now.add(InviteAttemptsService.lockDuration);
      expect(attempts.lockedUntil, isNull);
      expect(attempts.remainingAttempts, InviteAttemptsService.maxAttempts);
    });

    test('a valid code resets the count', () async {
      await typeBad();
      await preview('MESA34', typed: true);
      expect(attempts.remainingAttempts, InviteAttemptsService.maxAttempts);
    });

    test('scanned or linked codes never count or lock', () async {
      for (var i = 0; i < 6; i++) {
        await expectLater(preview('BAD234'), throwsA(isA<InviteFailure>()));
      }
      expect(attempts.remainingAttempts, InviteAttemptsService.maxAttempts);
      expect(attempts.lockedUntil, isNull);
    });

    test('an expired invite is a real code, not a typo', () async {
      invites.previewFailures['VENC22'] = const InviteFailure(
        InviteProblem.expired,
      );
      await expectLater(
        preview('VENC22', typed: true),
        throwsA(
          isA<InviteFailure>().having(
            (f) => f.problem,
            'problem',
            InviteProblem.expired,
          ),
        ),
      );
      expect(attempts.remainingAttempts, InviteAttemptsService.maxAttempts);
    });
  });
}
