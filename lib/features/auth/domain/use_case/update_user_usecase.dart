import 'package:dartz/dartz.dart';
import 'package:fanpulse/app/usecase/usecase.dart';
import 'package:fanpulse/core/error/failure.dart';
import 'package:fanpulse/features/auth/domain/entity/auth_entity.dart';
import 'package:fanpulse/features/auth/domain/repository/auth_repository.dart';


class UpdateUserUsecase implements UsecaseWithParams<void, AuthEntity> {
  final IAuthRepository repository;

  UpdateUserUsecase(this.repository);

  @override
  Future<Either<Failure, AuthEntity>> call(AuthEntity params) async {
    try {
      final authEntity = AuthEntity(
        name: params.name,
        email: params.email,
        phone: params.phone,
        username: params.username,
        image: params.image,
      );
      print('AUTHENTITY::: $authEntity');
      return repository.updateUser(authEntity);
    } catch (e) {
      return Left(
        SharedPrefsFailure(
            message: 'Unexpected error occurred: ${e.toString()}'),
      );
    }
  }
}