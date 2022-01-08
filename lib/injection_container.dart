import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/home/data/data_source/home_data_source.dart';
import 'feature/home/data/repository/home_repository_impl.dart';
import 'feature/home/domain/repository/home_repository.dart';
import 'feature/home/domain/use_case/get_educations.dart';
import 'feature/home/presentation/bloc/education_bloc.dart';
import 'feature/language/data/data_sources/language_data_source.dart';
import 'feature/language/data/repository/language_repository_impl.dart';
import 'feature/language/domain/repository/language_repository.dart';
import 'feature/language/domain/use_cases/get_app_language.dart';
import 'feature/language/domain/use_cases/set_app_language.dart';
import 'feature/language/presentation/cubit/language_cubit.dart';
import 'feature/theme/data/data_sources/theme_data_source.dart';
import 'feature/theme/data/repository/theme_repository_impl.dart';
import 'feature/theme/domain/repository/theme_repository.dart';
import 'feature/theme/domain/use_cases/get_app_theme.dart';
import 'feature/theme/domain/use_cases/set_app_theme.dart';
import 'feature/theme/presentation/cubit/theme_cubit.dart';
import 'feature/toast/presentation/manager/toast_manager.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  _initLanguageFeature();
  _initThemeFeature();
  _initToastFeature();
  _initHomeFeature();

  //! Core

  //! External
  sl.registerLazySingleton(() => http.Client());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}

//! Language
void _initLanguageFeature() {
  //  Bloc

  //  Cubit
  sl.registerFactory(() => LanguageCubit(
        getAppLanguage: sl(),
        setAppLanguage: sl(),
      ));
  //  Use Cases
  sl.registerLazySingleton(() => GetAppLanguage(repository: sl()));
  sl.registerLazySingleton(() => SetAppLanguage(repository: sl()));
  //  Repository
  sl.registerLazySingleton<LanguageRepository>(() => LanguageRepositoryImpl(
        dataSource: sl(),
      ));
  //  Data Soureces
  sl.registerLazySingleton<LanguageDataSource>(() => LanguageDataSourceImpl(
        localStorage: sl(),
      ));
}

//! Theme
void _initThemeFeature() {
  //  Bloc

  //  Cubit
  sl.registerFactory(() => ThemeCubit(
        getAppTheme: sl(),
        setAppTheme: sl(),
      ));
  //  Use Cases
  sl.registerLazySingleton(() => GetAppTheme(repository: sl()));
  sl.registerLazySingleton(() => SetAppTheme(repository: sl()));
  //  Repository
  sl.registerLazySingleton<ThemeRepository>(() => ThemeRepositoryImpl(
        dataSource: sl(),
      ));
  //  Data Soureces
  sl.registerLazySingleton<ThemeDataSource>(() => ThemeDataSourceImpl(
        localStorage: sl(),
      ));
}

//! Toast
void _initToastFeature() {
  sl.registerLazySingleton<ToastManager>(
      () => ToastManagerImpl(fToast: FToast()));
}

//! Home
void _initHomeFeature() {
  //  Bloc
  sl.registerFactory(() => EducationBloc(getEducations: sl()));
  //  Cubit
  //  Use Cases
  sl.registerLazySingleton(() => GetEducations(repository: sl()));
  //  Repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        dataSource: sl(),
      ));
  //  Data Soureces
  sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());
}
