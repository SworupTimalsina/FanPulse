import 'package:equatable/equatable.dart';
import 'package:fanpulse/features/article/domain/entity/article_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_api_model.g.dart';

@JsonSerializable()
class ArticleApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? articleId;
  final String title;
  final String content;
  final String? image;
  final String author;

  const ArticleApiModel({
    this.articleId,
    required this.title,
    required this.content,
    this.image,
    required this.author,
  });

  const ArticleApiModel.empty()
      : articleId = '',
        title = '',
        content = '',
        image = '',
        author = '';

  // From Json – full code without using code generation
  factory ArticleApiModel.fromJson(Map<String, dynamic> json) {
    return ArticleApiModel(
      articleId: json['_id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      author: json['author']?.toString() ?? '',
    );
  }

  // To Json – full code without using code generation
  Map<String, dynamic> toJson() {
    return {
      '_id': articleId,
      'title': title,
      'content': content,
      // Return null for image if it's empty so the key can be omitted in JSON
      'image': image?.isEmpty ?? true ? null : image,
      'author': author,
    };
  }

  // Convert API Object to Domain Entity
  ArticleEntity toEntity() => ArticleEntity(
        articleId: articleId,
        title: title,
        content: content,
        image: image ?? '',
        author: author,
      );

  // Convert Domain Entity to API Object
  static ArticleApiModel fromEntity(ArticleEntity entity) => ArticleApiModel(
        articleId: entity.articleId,
        title: entity.title,
        content: entity.content,
        author: entity.author,
        image: entity.image,
      );

  // Convert List of API Models to List of Domain Entities
  static List<ArticleEntity> toEntityList(List<ArticleApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [articleId, title, content, image, author];
}
