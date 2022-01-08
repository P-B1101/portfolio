import '../entiries/app_theme.dart';
import '../repository/theme_repository.dart';

/// Request for saved[AppTheme] from [ThemeRepository].
///
/// Return [AppThemeModel.defaultTheme] if nothing saved.
///
class GetAppTheme {
  final ThemeRepository repository;

  const GetAppTheme({
    required this.repository,
  });

  AppTheme call() => repository.getTheme;
}
