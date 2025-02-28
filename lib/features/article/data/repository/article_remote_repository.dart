import 'package:dartz/dartz.dart';
import 'package:fanpulse/core/error/failure.dart';
import 'package:fanpulse/features/article/data/data_source/article_remote_data_source.dart';
import 'package:fanpulse/features/article/domain/entity/article_entity.dart';
import 'package:fanpulse/features/article/domain/repository/article_repository.dart';

class ArticleRemoteRepository implements IArticleRepository {
  final ArticleRemoteDataSource remoteDataSource;

  ArticleRemoteRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> createArticle(ArticleEntity article) async {
    try {
      remoteDataSource.createArticle(article);
      return Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteArticle(String id, String? token) async {
    try {
      remoteDataSource.deleteArticle(id, token);
      return Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> getArticles() async {
    try {
      final articles = await remoteDataSource.getArticles();
      return Right(articles);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
