// import 'package:dartz/dartz.dart';
// import 'package:fanpulse/app/usecase/usecase.dart';
// import 'package:fanpulse/core/error/failure.dart';
// import 'package:fanpulse/features/article/domain/entity/article_entity.dart';
// import 'package:fanpulse/features/article/domain/repository/article_repository.dart';

// class GetAllArticleUsecase
//     implements UsecaseWithoutParams<List<ArticleEntity>> {
//   final IArticleRepository _articleRepository;

//   GetAllArticleUsecase({required IArticleRepository articleRepository})
//       : _articleRepository = articleRepository;

//   @override
//   Future<Either<Failure, List<ArticleEntity>>> call() {
//     return _articleRepository.getArticles();
//   }
// }
