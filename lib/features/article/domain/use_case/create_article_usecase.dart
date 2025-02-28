import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fanpulse/app/usecase/usecase.dart';
import 'package:fanpulse/core/error/failure.dart';
import 'package:fanpulse/features/article/domain/entity/article_entity.dart';
import 'package:fanpulse/features/article/domain/repository/article_repository.dart';

class CreateArticleParams extends Equatable {
  final String title;
  final String content;
  final String? image;
  final String author;

  const CreateArticleParams({
    required this.title,
    required this.content,
    this.image,
    required this.author,
  });

  // Empty constructor
  const CreateArticleParams.empty()
      : title = '_empty.string',
        content = '_empty.string',
        image = '_empty.string',
        author = '_empty.string';

  @override
  List<Object?> get props => [title, content, image, author];
}

class CreateArticleUseCase
    implements UsecaseWithParams<void, CreateArticleParams> {
  final IArticleRepository articleRepository;

  CreateArticleUseCase({required this.articleRepository});

  @override
  Future<Either<Failure, void>> call(CreateArticleParams params) async {
    return await articleRepository.createArticle(
      ArticleEntity(
        title: params.title,
        content: params.content,
        image: params.image,
        author: params.author,
      ),
    );
  }
}
