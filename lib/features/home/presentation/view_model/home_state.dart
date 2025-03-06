import 'package:equatable/equatable.dart';
import 'package:fanpulse/app/di/di.dart';
import 'package:fanpulse/features/article/presentation/view/add_article_view.dart';
import 'package:fanpulse/features/article/presentation/view/article_view.dart';
import 'package:fanpulse/features/article/presentation/view_model/article_bloc.dart';
import 'package:fanpulse/features/auth/presentation/view/profile_screen_view.dart';
import 'package:fanpulse/features/auth/presentation/viewmodel/profile/profile_bloc.dart';
import 'package:fanpulse/features/message/presentation/view/message_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        BlocProvider(
          create: (context) => getIt<ArticleBloc>(),
          child: const ArticlePage(),
        ),
        BlocProvider(
          create: (context) => getIt<ArticleBloc>(),
          child: const AddArticlePage(),
        ),
        MessagingPage(),
        BlocProvider(
          create: (context) => getIt<ProfileBloc>(),
          child: const ProfilePage(),
        ),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
