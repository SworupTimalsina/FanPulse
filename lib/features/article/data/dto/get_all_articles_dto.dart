import 'package:fanpulse/features/article/data/model/article_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_articles_dto.g.dart';

@JsonSerializable()
class GetAllArticlesDTO {
  final bool success;
  final int count;
  final List<ArticleApiModel> data;

  GetAllArticlesDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllArticlesDTOToJson(this);

  factory GetAllArticlesDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllArticlesDTOFromJson(json);
}
