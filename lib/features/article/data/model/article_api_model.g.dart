// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleApiModel _$ArticleApiModelFromJson(Map<String, dynamic> json) =>
    ArticleApiModel(
      articleId: json['_id'] as String?,
      title: json['title'] as String,
      content: json['content'] as String,
      image: json['image'] as String?,
      author: json['author'] as String,
    );

Map<String, dynamic> _$ArticleApiModelToJson(ArticleApiModel instance) =>
    <String, dynamic>{
      '_id': instance.articleId,
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'author': instance.author,
    };
