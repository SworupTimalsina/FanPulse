import 'package:dio/dio.dart';
import 'package:fanpulse/app/constants/api_endpoints.dart';
import 'package:fanpulse/features/article/data/data_source/article_data_source.dart';
import 'package:fanpulse/features/article/data/dto/get_all_articles_dto.dart';
import 'package:fanpulse/features/article/data/model/article_api_model.dart';
import 'package:fanpulse/features/article/domain/entity/article_entity.dart';

class ArticleRemoteDataSource implements IArticleDataSource {
  final Dio _dio;

  ArticleRemoteDataSource(this._dio);

  @override
  Future<void> createArticle(ArticleEntity article) async {
    try {
      // Convert entity to model
      var articleApiModel = ArticleApiModel.fromEntity(article);
      var response = await _dio.post(
        ApiEndpoints.createArticle,
        data: articleApiModel.toJson(),
      );
      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteArticle(String id, String? token) async {
    try {
      var response = await _dio.delete(
        ApiEndpoints.deleteArticle + id,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ArticleEntity>> getArticles() async {
    try {
      var response = await _dio.get(
        ApiEndpoints.getAllArticles,
      );

      GetAllArticlesDTO articleDTO = GetAllArticlesDTO.fromJson(response.data);
      return ArticleApiModel.toEntityList(articleDTO.data);
    } on DioException catch (e) {
      throw Exception((e));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
