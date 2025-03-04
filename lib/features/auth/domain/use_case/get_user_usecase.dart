import 'package:dartz/dartz.dart';
import 'package:fanpulse/app/shared_prefs/token_shared_prefs.dart';
import 'package:fanpulse/app/usecase/usecase.dart';
import 'package:fanpulse/core/error/failure.dart';
import 'package:fanpulse/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_test/flutter_test.dart';


class GetUserUsecase implements UsecaseWithoutParams<AuthEntity> {
  final TokenSharedPrefs _tokenSharedPrefs;

  GetUserUsecase({
    required TokenSharedPrefs tokenSharedPrefs,
  }) : _tokenSharedPrefs = tokenSharedPrefs;

  @override
  Future<Either<Failure, AuthEntity>> call() async {
    try {
      final userMap = await _tokenSharedPrefs.getUser();
      print('USER MAP:: ${userMap.runtimeType}');

      if (userMap == null) {
        return const Left(SharedPrefsFailure(message: "User data not found"));
      }
      print('USER MAP CONTENTS:: $userMap');
      // Convert the Map into an AuthEntity instance
      final user = AuthEntity.fromJson(userMap);
      print('USER:: $user');
      return Right(user);
    } catch (e) {
      print("Why error: ${e.toString()}");
      return Left(
        SharedPrefsFailure(
            message: 'Unexpected error occurred: ${e.toString()}'),
      );
    }
  }
}