import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/core/services/session_context/session_context_service.dart';
import 'package:gold_roundtables/features/notifications/domain/use_cases/delivery/unregister_device_use_case.dart';
import 'package:gold_roundtables/features/settings/domain/services/sign_out_service.dart';
import 'package:gold_roundtables/features/settings/domain/use_cases/account/sign_out_use_case.dart';
import 'package:mocktail/mocktail.dart';

class _MockUnregister extends Mock implements UnregisterDeviceUseCase {}

class _MockSignOut extends Mock implements SignOutService {}

class _FakeContext implements SessionContextService {
  SessionContext? value = const SessionContext(role: UserRole.member);

  @override
  SessionContext? get current => value;

  @override
  Future<void> clear() async => value = null;

  @override
  Future<void> select(SessionContext context) async => value = context;

  @override
  Stream<SessionContext?> watch() => Stream.value(value);
}

void main() {
  late _MockUnregister unregister;
  late _MockSignOut signOut;
  late _FakeContext context;
  late SignOutUseCase useCase;
  final calls = <String>[];

  setUp(() {
    calls.clear();
    unregister = _MockUnregister();
    signOut = _MockSignOut();
    context = _FakeContext();
    when(() => unregister()).thenAnswer((_) async => calls.add('unregister'));
    when(() => signOut.signOut()).thenAnswer((_) async => calls.add('signOut'));
    useCase = SignOutUseCase(unregister, context, signOut);
  });

  test('removes the push token before ending the session', () async {
    await useCase();
    expect(calls, ['unregister', 'signOut']);
    expect(context.current, isNull);
  });

  test('a failing sign-out surfaces to the caller', () async {
    when(() => signOut.signOut()).thenThrow(StateError('network'));
    await expectLater(useCase(), throwsStateError);
  });
}
