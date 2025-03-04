import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fanpulse/features/article/domain/entity/article_entity.dart';
import 'package:fanpulse/features/article/domain/use_case/create_article_usecase.dart';
import 'package:fanpulse/features/article/domain/use_case/delete_article_usecase.dart';
import 'package:fanpulse/features/article/domain/use_case/get_all_article_usecase.dart';
import 'package:flutter/foundation.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final CreateArticleUseCase _createArticleUseCase;
  final GetAllArticleUseCase _getAllArticleUseCase;
  final DeleteArticleUsecase _deleteArticleUsecase;

  ArticleBloc({
    required CreateArticleUseCase createArticleUseCase,
    required GetAllArticleUseCase getAllArticleUseCase,
    required DeleteArticleUsecase deleteArticleUsecase,
  })  : _createArticleUseCase = createArticleUseCase,
        _getAllArticleUseCase = getAllArticleUseCase,
        _deleteArticleUsecase = deleteArticleUsecase,
        super(ArticleState.initial()) {
    on<LoadArticles>(_onLoadArticles);
    on<AddArticle>(_onAddArticle);
    on<DeleteArticle>(_onDeleteArticle);

    // Call this event whenever the bloc is created to load the article
    add(LoadArticles());
  }

  Future<void> _onLoadArticles(
      LoadArticles event, Emitter<ArticleState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllArticleUseCase.call();
    print('Result: $result');
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (articles) => emit(state.copyWith(isLoading: false, articles: articles)),
    );
  }

  Future<void> _onAddArticle(
      AddArticle event, Emitter<ArticleState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createArticleUseCase.call(CreateArticleParams(
        title: event.title,
        content: event.content,
        image: event.image,
        author: event.author));
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (articles) {
        emit(state.copyWith(isLoading: false, error: null));
        add(LoadArticles());
      },
    );
  }

  Future<void> _onDeleteArticle(
      DeleteArticle event, Emitter<ArticleState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _deleteArticleUsecase
        .call(DeleteArticleParams(articleId: event.articleId));
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (batches) {
        emit(state.copyWith(isLoading: false, error: null));
        add(LoadArticles());
      },
    );
  }
}
