import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fanpulse/app/shared_prefs/token_shared_prefs.dart';
import 'package:fanpulse/app/usecase/usecase.dart';
import 'package:fanpulse/core/error/failure.dart';
import 'package:fanpulse/features/article/domain/repository/article_repository.dart';

class DeleteArticleParams extends Equatable {
  final String articleId;

  const DeleteArticleParams({required this.articleId});

  const DeleteArticleParams.empty() : articleId = '_empty.string';

  @override
  List<Object?> get props => [
        articleId,
      ];
}

class DeleteArticleUsecase
    implements UsecaseWithParams<void, DeleteArticleParams> {
  final IArticleRepository articleRepository;
  final TokenSharedPrefs tokenSharedPrefs;

  DeleteArticleUsecase({
    required this.articleRepository,
    required this.tokenSharedPrefs,
  });

  @override
  Future<Either<Failure, void>> call(DeleteArticleParams params) async {
    // Get token from Shared Preferences and send it to the server
    final token = await tokenSharedPrefs.getToken();
    return token.fold((l) {
      return Left(l);
    }, (r) async {
      return await articleRepository.deleteArticle(params.articleId, r);
    });
  }
}
