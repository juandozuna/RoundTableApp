import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/settings/data/datasources/settings_remote_data_source.dart';
import 'package:gold_roundtables/features/settings/data/services/profile_service_impl.dart';
import 'package:gold_roundtables/features/settings/domain/models/my_account.dart';
import 'package:gold_roundtables/features/settings/domain/models/profile_update.dart';
import 'package:gold_roundtables/features/settings/domain/models/user_profile.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements SettingsRemoteDataSource {}

class _FakeUpdate extends Fake implements ProfileUpdate {}

void main() {
  setUpAll(() => registerFallbackValue(_FakeUpdate()));

  late _MockRemote remote;
  late ProfileServiceImpl service;
  const person = UserProfile(
    id: 'p1',
    firstName: 'Ana Lucía',
    lastName: 'Méndez',
  );

  setUp(() {
    remote = _MockRemote();
    service = ProfileServiceImpl(remote);
  });

  test('load returns the first person bound to the sign-in', () async {
    when(
      () => remote.me(),
    ).thenAnswer((_) async => const MyAccount(people: [person]));
    expect(await service.load(), person);
  });

  test('load is null when no person is bound yet', () async {
    when(() => remote.me()).thenAnswer((_) async => const MyAccount());
    expect(await service.load(), isNull);
  });

  test('update returns the stored person', () async {
    when(
      () => remote.updateMe(any()),
    ).thenAnswer((_) async => const MyAccount(people: [person]));
    expect(
      await service.update(
        const ProfileUpdate(firstName: 'Ana Lucía', lastName: 'Méndez'),
      ),
      person,
    );
  });

  test('account JSON parses the admin/me person shape', () {
    final account = MyAccount.fromJson({
      'auth_user_id': 'u',
      'people': [
        {
          'id': 'p1',
          'organization_id': 'o1',
          'first_name': 'Ana Lucía',
          'last_name': 'Méndez',
          'position': null,
          'email': 'ana@dev.local',
          'phone': '+18095550101',
          'status': 'active',
          'linked': true,
        },
      ],
      'contexts': [],
    });
    expect(account.people.single.fullName, 'Ana Lucía Méndez');
    expect(account.people.single.phone, '+18095550101');
  });
}
