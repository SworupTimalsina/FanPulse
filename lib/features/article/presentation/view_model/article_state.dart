// part of 'article_bloc.dart';

// class ArticleState extends Equatable {
//   final bool isLoading;
//   final List<ArticleEntity> articles;
//   final String error;

//   const ArticleState({
//     required this.isLoading,
//     required this.articles,
//     required this.error,
//   });

//   factory ArticleState.initial() {
//     return ArticleState(
//       isLoading: false,
//       articles: const [],
//       error: '',
//     );
//   }

//   ArticleState copyWith({
//     bool? isLoading,
//     List<ArticleEntity>? articles,
//     String? error,
//   }) {
//     return ArticleState(
//       isLoading: isLoading ?? this.isLoading,
//       articles: articles ?? this.articles,
//       error: error ?? this.error,
//     );
//   }

//   @override
//   List<Object?> get props => [isLoading, articles, error];
// }
