import 'package:dartz/dartz.dart';
import 'package:fanpulse/core/error/failure.dart';
import 'package:fanpulse/features/article/domain/entity/article_entity.dart';

abstract interface class IArticleRepository {
  Future<Either<Failure, List<ArticleEntity>>> getArticles();
  Future<Either<Failure, void>> createArticle(ArticleEntity article);
  Future<Either<Failure, void>> deleteArticle(String id, String? token);
}
