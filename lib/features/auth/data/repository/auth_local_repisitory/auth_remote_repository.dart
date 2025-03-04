import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fanpulse/core/error/failure.dart';
import 'package:fanpulse/features/auth/data/data_sourse/remote_data_source/auth_remote_data_source.dart';
import 'package:fanpulse/features/auth/domain/entity/auth_entity.dart';
import 'package:fanpulse/features/auth/domain/repository/auth_repository.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, void>> registerUser(AuthEntity user) async {
    try {
      await _authRemoteDataSource.registerUser(user);
      return Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser(
      String? token, String userID) async {
    try {
      final user = await _authRemoteDataSource.getCurrentUser(token, userID);
      print("USERRR:: $user");
      return Right(user);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> loginUser(
      String email, String password) async {
    try {
      final token = await _authRemoteDataSource.loginUser(email, password);
      return Right(token);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    try {
      final imageName = await _authRemoteDataSource.uploadProfilePicture(file);
      return Right(imageName);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> updateUser(AuthEntity user) async {
    print('User update response::::::: $user');
    try {
      final response = await _authRemoteDataSource.updateUser(user);
      print("User update response $response");
      return Right(response);
    } catch (e) {
      print('ERROR $e');
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
