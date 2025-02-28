import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String? articleId;
  final String title;
  final String content;
  final String? image;
  final String author;

  const ArticleEntity({
    this.articleId,
    required this.title,
    required this.content,
    this.image,
    required this.author,
  });

  @override
  List<Object?> get props => [articleId, title, content, image, author];
}
