import '../entiries/app_theme.dart';

abstract class ThemeRepository {
  /// save [AppTheme] that user selected.
  ///
  Future<void> setTheme(AppTheme theme);

  /// return [AppTheme] that saved.
  ///
  /// return [AppThemeModel.defaultTheme] in nothing saved.
  ///
  AppTheme get getTheme;
}
