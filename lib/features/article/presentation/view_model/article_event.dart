part of 'article_bloc.dart';

@immutable
sealed class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

final class LoadArticles extends ArticleEvent {}

class LoadImage extends ArticleEvent {
  final File file;

  const LoadImage({
    required this.file,
  });
}



final class AddArticle extends ArticleEvent {

  final String title;
  final String content;
  final String? image;
  final String author;

  const AddArticle({

    required this.title,
    required this.content,
    this.image,
    required this.author,
  });

  @override
  List<Object> get props => [ title, content, author];
}

final class DeleteArticle extends ArticleEvent {
  final String articleId;

  const DeleteArticle(this.articleId);

  @override
  List<Object> get props => [articleId];
}

 
 
 
