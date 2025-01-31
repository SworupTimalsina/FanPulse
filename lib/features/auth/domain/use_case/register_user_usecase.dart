import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fanpulse/app/usecase/usecase.dart';
import 'package:fanpulse/core/error/failure.dart';
import 'package:fanpulse/features/auth/domain/entity/auth_entity.dart';
import 'package:fanpulse/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String name;
  final String email;
  final String username;
  final String phone;
  final String password;
  final String? image;

  const RegisterUserParams(
      {required this.name,
      required this.email,
      required this.username,
      required this.phone,
      required this.password,
      this.image});

  //intial constructor
  const RegisterUserParams.initial({
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props => [name, image, email, username, phone, password];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      name: params.name,
      email: params.email,
      username: params.username,
      phone: params.phone,
      password: params.password,
      image: params.image,
    );
    return repository.registerUser(authEntity);
  }
}
