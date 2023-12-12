import 'package:injectable/injectable.dart';
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

const themeKey = 'ThemeKey';

@LazySingleton(as: ThemeDataSource)
class ThemeDataSourceImpl implements ThemeDataSource {
  final SharedPreferences localStorage;

  const ThemeDataSourceImpl({
    required this.localStorage,
  });

  @override
  Future<void> setTheme(AppTheme theme) =>
      localStorage.setInt(themeKey, theme.id);

  @override
  AppTheme get getAppTheme {
    final id = localStorage.getInt(themeKey);
    if (id == null) throw NoThemeSavedException();
    return AppThemeModel.fromId(id);
  }
}
