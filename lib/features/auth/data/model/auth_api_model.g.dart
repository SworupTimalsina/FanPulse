// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      id: json['_id'] as String?,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      image: json['image'] as String?,
      username: json['username'] as String,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'image': instance.image,
      'username': instance.username,
      'password': instance.password,
    };
