import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String name;
  final String email;
  final String? image;
  final String username;
  final String phone;
  final String password;

  const AuthEntity({
    this.userId,
    required this.name,
    required this.email,
    this.image,
    required this.username,
    required this.phone,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [userId, name, email, image, username, phone, password];
}
