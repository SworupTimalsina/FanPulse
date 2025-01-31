// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:fanpulse/features/article/domain/entity/article_entity.dart';
// import 'package:fanpulse/features/article/domain/use_case/create_article_usecase.dart';
// import 'package:fanpulse/features/article/domain/use_case/delete_article_usecase.dart';
// import 'package:fanpulse/features/article/domain/use_case/get_all_article_usecase.dart';

// part 'article_event.dart';
// part 'article_state.dart';

// class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
//   final GetAllArticleUsecase _getAllArticleUsecase;
//   final CreateArticleUsecase _createArticleUsecase;
//   final DeleteArticleUsecase _deleteArticleUsecase;
//   ArticleBloc({
//     required GetAllArticleUsecase getAllArticleUsecase,
//     required CreateArticleUsecase createArticleUsecase,
//     required DeleteArticleUsecase deleteArticleUsecase,
//   })  : _getAllArticleUsecase = getAllArticleUsecase,
//         _createArticleUsecase = createArticleUsecase,
//         _deleteArticleUsecase = deleteArticleUsecase,
//         super(ArticleState.initial()) {
//     on<ArticleLoad>(_onArticleLoad);
//     on<CreateArticle>(_onCreateArticle);
//     on<DeleteArticle>(_onDeleteArticle);

//     add(ArticleLoad());
//   }

//   Future<void> _onArticleLoad(
//     ArticleLoad event,
//     Emitter<ArticleState> emit,
//   ) async {
//     emit(state.copyWith(isLoading: true));
//     final result = await _getAllArticleUsecase();
//     result.fold(
//       (failure) =>
//           emit(state.copyWith(isLoading: false, error: failure.message)),
//       (articles) => emit(state.copyWith(isLoading: false, articles: articles)),
//     );
//   }

//   Future<void> _onCreateArticle(
//     CreateArticle event,
//     Emitter<ArticleState> emit,
//   ) async {
//     emit(state.copyWith(isLoading: true));
//     final result = await _createArticleUsecase(
//         CreateArticleParams(articleName: event.articleName));
//     result.fold(
//       (failure) =>
//           emit(state.copyWith(isLoading: false, error: failure.message)),
//       (_) {
//         emit(state.copyWith(isLoading: false));
//         add(ArticleLoad());
//       },
//     );
//   }

//   Future<void> _onDeleteArticle(
//     DeleteArticle event,
//     Emitter<ArticleState> emit,
//   ) async {
//     emit(state.copyWith(isLoading: true));
//     final result =
//         await _deleteArticleUsecase(DeleteArticleParams(id: event.id));
//     result.fold(
//       (failure) =>
//           emit(state.copyWith(isLoading: false, error: failure.message)),
//       (_) {
//         emit(state.copyWith(isLoading: false));
//         add(ArticleLoad());
//       },
//     );
//   }
// }
