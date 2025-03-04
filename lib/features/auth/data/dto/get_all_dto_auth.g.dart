// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_dto_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllAuthDTO _$GetAllAuthDTOFromJson(Map<String, dynamic> json) =>
    GetAllAuthDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => AuthApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllAuthDTOToJson(GetAllAuthDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
