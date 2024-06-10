import 'package:auth/core/core.dart';
import 'package:auth/data/data.dart';
import 'package:auth/domain/domain.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared/shared.dart';

class MockILocalStorageAdapter extends Mock implements ILocalStorageAdapter {}

void main() {
  late ILocalStorageRepository repository;
  late MockILocalStorageAdapter mockLocalStorageAdapter;

  setUp(() {
    mockLocalStorageAdapter = MockILocalStorageAdapter();
    repository =
        LocalStorageRepository(localStorageAdapter: mockLocalStorageAdapter);
  });

  group('authenticate', () {
    const username = 'testuser';
    const password = 'testpassword';
    const userJson = '{"username":"testuser","password":"testpassword"}';
    const userKey = 'user';

    test('should save user on first authenticate call and return right(unit)',
        () async {
      when(() => mockLocalStorageAdapter.fetch(any())).thenReturn(null);
      when(() => mockLocalStorageAdapter.save(
          key: any(named: 'key'),
          value: any(named: 'value'))).thenAnswer((_) async => Future.value());

      final result =
          await repository.authenticate(username: username, password: password);

      expect(result, right(unit));
      expect(repository.isAuthenticated, true);
      verify(() => mockLocalStorageAdapter.save(key: userKey, value: userJson))
          .called(1);
    });

    test('should authenticate existing user with correct username and password',
        () async {
      when(() => mockLocalStorageAdapter.fetch(any())).thenReturn(userJson);

      final result =
          await repository.authenticate(username: username, password: password);

      expect(result, right(unit));
      expect(repository.isAuthenticated, true);
      verify(() => mockLocalStorageAdapter.fetch(userKey)).called(1);
    });

    test(
        'should return unauthorized failure when username or password is incorrect',
        () async {
      when(() => mockLocalStorageAdapter.fetch(any())).thenReturn(userJson);

      final result = await repository.authenticate(
          username: username, password: 'wrongpassword');

      expect(result, left(Failure(type: ExceptionType.unauthorized)));
      expect(repository.isAuthenticated, false);
    });

    test('should return server error failure on exception', () async {
      when(() => mockLocalStorageAdapter.fetch(any())).thenThrow(Exception());

      final result =
          await repository.authenticate(username: username, password: password);

      expect(result, left(Failure(type: ExceptionType.serverError)));
      expect(repository.isAuthenticated, false);
    });
  });

  group('clear', () {
    test('should clear local storage', () {
      repository.clear();

      verify(() => mockLocalStorageAdapter.clear()).called(1);
    });
  });
}
