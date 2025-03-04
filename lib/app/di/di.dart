import 'package:dio/dio.dart';
import 'package:fanpulse/app/shared_prefs/token_shared_prefs.dart';
import 'package:fanpulse/core/network/api_service.dart';
import 'package:fanpulse/core/network/hive_service.dart';
import 'package:fanpulse/features/article/data/data_source/article_remote_data_source.dart';
import 'package:fanpulse/features/article/data/repository/article_remote_repository.dart';
import 'package:fanpulse/features/article/domain/use_case/create_article_usecase.dart';
import 'package:fanpulse/features/article/domain/use_case/delete_article_usecase.dart';
import 'package:fanpulse/features/article/domain/use_case/get_all_article_usecase.dart';
import 'package:fanpulse/features/article/presentation/view_model/article_bloc.dart';
import 'package:fanpulse/features/auth/data/data_sourse/local_data_source/auth_local_datasource.dart';
import 'package:fanpulse/features/auth/data/data_sourse/remote_data_source/auth_remote_data_source.dart';
import 'package:fanpulse/features/auth/data/repository/auth_local_repisitory/auth_local_repository.dart';
import 'package:fanpulse/features/auth/data/repository/auth_local_repisitory/auth_remote_repository.dart';
import 'package:fanpulse/features/auth/domain/use_case/get_user_usecase.dart';
import 'package:fanpulse/features/auth/domain/use_case/login_usecase.dart';
import 'package:fanpulse/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:fanpulse/features/auth/domain/use_case/update_user_usecase.dart';
import 'package:fanpulse/features/auth/domain/use_case/upload_image_use_case.dart';
import 'package:fanpulse/features/auth/presentation/viewmodel/login/login_bloc.dart';
import 'package:fanpulse/features/auth/presentation/viewmodel/profile/profile_bloc.dart';
import 'package:fanpulse/features/auth/presentation/viewmodel/signup/register_bloc.dart';
import 'package:fanpulse/features/home/presentation/view_model/home_cubit.dart';
import 'package:fanpulse/features/splash/presentation/view_model/onboarding_cubit.dart';
import 'package:fanpulse/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();
  await _initApiService();
  await _initSharedPreferences();
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initOnboardingScreenDependencies();
  await _initArticleDependencies();
  await _initProfileDependencies();

  await _initSplashScreenDependencies();
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

_initApiService() {
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initRegisterDependencies() {
  // init local data source
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>(), getIt<TokenSharedPrefs>()),
  );

  // init local repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );

  // register use usecase
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
      uploadImageUsecase: getIt(),
    ),
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initLoginDependencies() async {
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}

_initArticleDependencies() async {
  // =========================== Data Source ===========================
  // getIt.registerFactory<BatchLocalDataSource>(
  //     () => BatchLocalDataSource(hiveService: getIt<HiveService>()));

  getIt.registerLazySingleton<ArticleRemoteDataSource>(
    () => ArticleRemoteDataSource(
      getIt<Dio>(),
    ),
  );

  // =========================== Repository ===========================

  // getIt.registerLazySingleton<ItemLocalRepository>(() => BatchLocalRepository(
  //     batchLocalDataSource: getIt<BatchLocalDataSource>()));

  getIt.registerLazySingleton(
    () => ArticleRemoteRepository(
      remoteDataSource: getIt<ArticleRemoteDataSource>(),
    ),
  );

  // =========================== Usecases ===========================

  getIt.registerLazySingleton<CreateArticleUseCase>(
    () => CreateArticleUseCase(
        articleRepository: getIt<ArticleRemoteRepository>()),
  );

  getIt.registerLazySingleton<GetAllArticleUseCase>(
    () => GetAllArticleUseCase(
        articleRepository: getIt<ArticleRemoteRepository>()),
  );

  getIt.registerLazySingleton<DeleteArticleUsecase>(
    () => DeleteArticleUsecase(
      articleRepository: getIt<ArticleRemoteRepository>(),
      tokenSharedPrefs: getIt<TokenSharedPrefs>(),
    ),
  );

  // =========================== Bloc ===========================
  getIt.registerFactory<ArticleBloc>(
    () => ArticleBloc(
      createArticleUseCase: getIt<CreateArticleUseCase>(),
      getAllArticleUseCase: getIt<GetAllArticleUseCase>(),
      deleteArticleUsecase: getIt<DeleteArticleUsecase>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<OnboardingCubit>()),
  );
}

_initProfileDependencies() async {
  getIt.registerLazySingleton<GetUserUsecase>(
    () => GetUserUsecase(
      tokenSharedPrefs: getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerLazySingleton<UpdateUserUsecase>(
    () => UpdateUserUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(
        tokenSharedPrefs: getIt<TokenSharedPrefs>(),
        updateUserUsecase: getIt<UpdateUserUsecase>(),
        getUserUsecase: getIt<GetUserUsecase>()),
  );
}

_initOnboardingScreenDependencies() async {
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(),
  );
}
