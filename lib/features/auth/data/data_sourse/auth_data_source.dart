import 'dart:io';

import 'package:fanpulse/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthDataSource {
  Future<String> loginUser(String email, String password);

  Future<void> registerUser(AuthEntity user);

  Future<AuthEntity> getCurrentUser(String? token, String userId);
  Future<AuthEntity> updateUser(AuthEntity userId);

  Future<String> uploadProfilePicture(File file);
}
