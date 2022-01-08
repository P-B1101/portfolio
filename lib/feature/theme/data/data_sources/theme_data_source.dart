import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entiries/app_theme.dart';
import '../models/app_theme_model.dart';

abstract class ThemeDataSource {
  /// save user selected Theme in [SharedPreferences]
  ///
  Future<void> setTheme(AppTheme theme);

  /// get user selected Theme from [SharedPreferences]
  ///
  /// throw [NoThemeSavedException] if nothing found.
  ///
  AppTheme get getAppTheme;
}

const THEME_KEY = 'ThemeKey';

class ThemeDataSourceImpl implements ThemeDataSource {
  final SharedPreferences localStorage;

  const ThemeDataSourceImpl({
    required this.localStorage,
  });

  @override
  Future<void> setTheme(AppTheme theme) =>
      localStorage.setInt(THEME_KEY, theme.id);

  @override
  AppTheme get getAppTheme {
    final id = localStorage.getInt(THEME_KEY);
    if (id == null) throw NoThemeSavedException();
    return AppThemeModel.fromId(id);
  }
}
