import 'package:equatable/equatable.dart';
import 'package:fanpulse/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String name;
  final String phone;
  final String email;
  final String? image;
  final String username;
  final String? password;

  const AuthApiModel({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.image,
    required this.username,
    required this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: id,
      name: name,
      email: email,
      image: image,
      phone: phone,
      username: username,
      password: password ?? '',
    );
  }

  // From Entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      name: entity.name,
      email: entity.email,
      image: entity.image,
      phone: entity.phone,
      username: entity.username,
      password: entity.password,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, image, phone, email, username, password];
}
