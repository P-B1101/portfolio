import 'package:flutter/material.dart';

import '../../domain/entiries/app_theme.dart';

class AppThemeModel extends AppTheme {
  const AppThemeModel({
    required int id,
    required ThemeMode theme,
  }) : super(
          id: id,
          theme: theme,
        );

  factory AppThemeModel.fromId(int id) => AppThemeModel(
        id: id,
        theme: id == 0
            ? ThemeMode.light
            : id == 1
                ? ThemeMode.dark
                : ThemeMode.system,
      );

  factory AppThemeModel.fromThemeMode(ThemeMode mode) => AppThemeModel(
        id: mode == ThemeMode.light
            ? 0
            : mode == ThemeMode.dark
                ? 1
                : 2,
        theme: mode,
      );

  factory AppThemeModel.defaultTheme() => const AppThemeModel(
        id: 0,
        theme: ThemeMode.dark,
      );
}
