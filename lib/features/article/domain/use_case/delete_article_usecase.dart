// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:fanpulse/app/usecase/usecase.dart';
// import 'package:fanpulse/core/error/failure.dart';
// import 'package:fanpulse/features/article/domain/repository/article_repository.dart';

// class DeleteArticleParams extends Equatable {
//   final String id;

//   const DeleteArticleParams({required this.id});

//   const DeleteArticleParams.empty() : id = '_empty.string';

//   @override
//   List<Object?> get props => [id];
// }

// // Use case
// class DeleteArticleUsecase
//     implements UsecaseWithParams<void, DeleteArticleParams> {
//   final IArticleRepository _articleRepository;

//   DeleteArticleUsecase({required IArticleRepository articleRepository})
//       : _articleRepository = articleRepository;

//   @override
//   Future<Either<Failure, void>> call(DeleteArticleParams params) {
//     return _articleRepository.deleteArticle(params.id);
//   }
// }
