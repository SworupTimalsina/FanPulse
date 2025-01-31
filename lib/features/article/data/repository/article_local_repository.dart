// import 'package:dartz/dartz.dart';
// import 'package:fanpulse/core/error/failure.dart';
// import 'package:fanpulse/features/article/data/data_source/article_local_data_source.dart';
// import 'package:fanpulse/features/article/domain/entity/article_entity.dart';
// import 'package:fanpulse/features/article/domain/repository/article_repository.dart';

// class ArticleLocalRepository implements IArticleRepository {
//   final ArticleLocalDataSource _articleLocalDataSource;

//   ArticleLocalRepository(
//       {required ArticleLocalDataSource articleLocalDataSource})
//       : _articleLocalDataSource = articleLocalDataSource;

//   @override
//   Future<Either<Failure, void>> createArticle(ArticleEntity article) {
//     try {
//       _articleLocalDataSource.createArticle(article);
//       return Future.value(Right(null));
//     } catch (e) {
//       return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> deleteArticle(String id) {
//     try {
//       _articleLocalDataSource.deleteArticle(id);
//       return Future.value(Right(null));
//     } catch (e) {
//       return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
//     }
//   }

//   @override
//   Future<Either<Failure, List<ArticleEntity>>> getArticles() {
//     try {
//       return _articleLocalDataSource.getArticles().then(
//         (value) {
//           return Right(value);
//         },
//       );
//     } catch (e) {
//       return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
//     }
//   }
// }
