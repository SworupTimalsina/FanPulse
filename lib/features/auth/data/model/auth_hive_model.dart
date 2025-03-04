import 'package:equatable/equatable.dart';
import 'package:fanpulse/app/constants/hive_table_constant.dart';
import 'package:fanpulse/features/auth/domain/entity/auth_entity.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String username;
  @HiveField(4)
  final String phone;
  @HiveField(5)
  final String? password;

  AuthHiveModel({
    String? userId,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // Initial Constructor
  const AuthHiveModel.initial()
      : userId = '',
        name = '',
        email = '',
        username = '',
        phone = '',
        password = '';

  // From Entity
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
      name: entity.name,
      email: entity.email,
      username: entity.username,
      phone: entity.phone,
      password: entity.password,
    );
  }

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: userId,
      name: name,
      email: email,
      username: username,
      phone: phone,
      password: password,
    );
  }

  @override
  List<Object?> get props => [userId, name, email, username, phone, password];
}
