import 'package:dartz/dartz.dart';
import 'package:fanpulse/app/usecase/usecase.dart';
import 'package:fanpulse/core/error/failure.dart';
import 'package:fanpulse/features/article/domain/entity/article_entity.dart';
import 'package:fanpulse/features/article/domain/repository/article_repository.dart';

class GetAllArticleUseCase
    implements UsecaseWithoutParams<List<ArticleEntity>> {
  final IArticleRepository articleRepository;

  GetAllArticleUseCase({required this.articleRepository});

  @override
  Future<Either<Failure, List<ArticleEntity>>> call() {
    print('GetAllArticleUseCase called');
    return articleRepository.getArticles();
  }
}
