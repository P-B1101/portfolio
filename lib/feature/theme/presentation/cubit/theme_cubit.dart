import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/app_theme_model.dart';
import '../../domain/entiries/app_theme.dart';
import '../../domain/use_cases/get_app_theme.dart';
import '../../domain/use_cases/set_app_theme.dart';

part 'theme_state.dart';

@injectable
class ThemeCubit extends Cubit<ThemeState> {
  final GetAppTheme getAppTheme;
  final SetAppTheme setAppTheme;

  ThemeCubit({
    required this.getAppTheme,
    required this.setAppTheme,
  }) : super(ThemeState(theme: getAppTheme()));

  /// Save [theme] using [SetAppTheme] usecase
  /// and emit it.
  ///
  set setApplicationTheme(ThemeMode theme) {
    final appTheme = AppThemeModel.fromThemeMode(theme);
    setAppTheme(appTheme);
    emit(ThemeState(theme: appTheme));
  }
}
