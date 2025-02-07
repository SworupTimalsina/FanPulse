import 'package:fanpulse/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthEntity', () {
    test('should support value equality', () {
      final auth1 = AuthEntity(
        userId: '123',
        name: 'John Doe',
        email: 'johndoe@example.com',
        image: 'profile.jpg',
        username: 'johndoe',
        phone: '1234567890',
        password: 'password123',
      );

      final auth2 = AuthEntity(
        userId: '123',
        name: 'John Doe',
        email: 'johndoe@example.com',
        image: 'profile.jpg',
        username: 'johndoe',
        phone: '1234567890',
        password: 'password123',
      );

      expect(auth1, equals(auth2));
    });

    test('should have correct props', () {
      final auth = AuthEntity(
        userId: '456',
        name: 'Alice Smith',
        email: 'alice@example.com',
        image: 'avatar.png',
        username: 'alicesmith',
        phone: '9876543210',
        password: 'securepass',
      );

      expect(
        auth.props,
        [
          '456',
          'Alice Smith',
          'alice@example.com',
          'avatar.png',
          'alicesmith',
          '9876543210',
          'securepass'
        ],
      );
    });

    test('should allow null userId', () {
      final auth = AuthEntity(
        userId: null,
        name: 'Jane Doe',
        email: 'janedoe@example.com',
        image: null,
        username: 'janedoe',
        phone: '1122334455',
        password: 'pass1234',
      );

      expect(auth.userId, isNull);
      expect(auth.image, isNull);
    });

    test('should differentiate objects with different usernames', () {
      final auth1 = AuthEntity(
        userId: '789',
        name: 'User One',
        email: 'userone@example.com',
        username: 'userone',
        phone: '5555555555',
        password: 'password1',
      );

      final auth2 = AuthEntity(
        userId: '789',
        name: 'User One',
        email: 'userone@example.com',
        username: 'user_two',
        phone: '5555555555',
        password: 'password1',
      );

      expect(auth1, isNot(equals(auth2)));
    });

    test('should return correct email', () {
      final auth = AuthEntity(
        userId: '111',
        name: 'Test User',
        email: 'testuser@example.com',
        username: 'testuser',
        phone: '9998887777',
        password: 'testpassword',
      );

      expect(auth.email, equals('testuser@example.com'));
    });

    test('should return correct phone number', () {
      final auth = AuthEntity(
        userId: '222',
        name: 'Example User',
        email: 'example@example.com',
        username: 'exampleuser',
        phone: '1231231234',
        password: 'securepass',
      );

      expect(auth.phone, equals('1231231234'));
    });

    test('should return correct name', () {
      final auth = AuthEntity(
        userId: '333',
        name: 'John Smith',
        email: 'johnsmith@example.com',
        username: 'johnsmith',
        phone: '4567891230',
        password: 'mypassword',
      );

      expect(auth.name, equals('John Smith'));
    });

    test('should return correct username', () {
      final auth = AuthEntity(
        userId: '444',
        name: 'Sarah Connor',
        email: 'sarah@example.com',
        username: 'sarahconnor',
        phone: '7894561230',
        password: 'futureleader',
      );

      expect(auth.username, equals('sarahconnor'));
    });

    test('should support empty strings', () {
      final auth = AuthEntity(
        userId: '',
        name: '',
        email: '',
        image: '',
        username: '',
        phone: '',
        password: '',
      );

      expect(auth.userId, equals(''));
      expect(auth.name, equals(''));
      expect(auth.email, equals(''));
      expect(auth.image, equals(''));
      expect(auth.username, equals(''));
      expect(auth.phone, equals(''));
      expect(auth.password, equals(''));
    });

    test('should allow null values in optional fields', () {
      final auth = AuthEntity(
        userId: '555',
        name: 'No Image User',
        email: 'noimage@example.com',
        image: null,
        username: 'noimage',
        phone: '3332221111',
        password: 'nopassword',
      );

      expect(auth.image, isNull);
    });
  });
}
