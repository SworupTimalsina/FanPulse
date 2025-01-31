// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:fanpulse/app/usecase/usecase.dart';
// import 'package:fanpulse/core/error/failure.dart';
// import 'package:fanpulse/features/article/domain/entity/article_entity.dart';
// import 'package:fanpulse/features/article/domain/repository/article_repository.dart';

// class CreateArticleParams extends Equatable {
//   final String articleName;

//   const CreateArticleParams({required this.articleName});

//   // Empty constructor
//   const CreateArticleParams.empty() : articleName = '_empty.string';

//   @override
//   List<Object?> get props => [articleName];
// }

// class CreateArticleUsecase
//     implements UsecaseWithParams<void, CreateArticleParams> {
//   final IArticleRepository _articleRepository;

//   CreateArticleUsecase({required IArticleRepository articleRepository})
//       : _articleRepository = articleRepository;

//   @override
//   Future<Either<Failure, void>> call(CreateArticleParams params) {
//     return _articleRepository.createArticle(
//       ArticleEntity(articleName: params.articleName),
//     );
//   }
// }
