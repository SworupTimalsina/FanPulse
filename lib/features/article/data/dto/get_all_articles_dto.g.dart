// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_articles_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllArticlesDTO _$GetAllArticlesDTOFromJson(Map<String, dynamic> json) =>
    GetAllArticlesDTO(
      success: json['success'] as bool,
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => ArticleApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllArticlesDTOToJson(GetAllArticlesDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
