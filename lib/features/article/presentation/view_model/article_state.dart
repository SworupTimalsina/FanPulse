part of 'article_bloc.dart';

class ArticleState extends Equatable {
  final List<ArticleEntity> articles;
  final bool isLoading;
  final String? error;

  const ArticleState({
    required this.articles,
    required this.isLoading,
    this.error,
  });

  factory ArticleState.initial() {
    return const ArticleState(
      articles: [],
      isLoading: false,
    );
  }

  ArticleState copyWith({
    List<ArticleEntity>? articles,
    bool? isLoading,
    String? error,
  }) {
    return ArticleState(
      articles: articles ?? this.articles,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [articles, isLoading, error];
}
