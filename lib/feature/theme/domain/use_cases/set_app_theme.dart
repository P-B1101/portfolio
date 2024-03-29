import 'package:injectable/injectable.dart';

import '../entiries/app_theme.dart';
import '../repository/theme_repository.dart';

/// Save [AppTheme] that user selected
///
/// uning [ThemeRepository].
///

@lazySingleton
class SetAppTheme {
  final ThemeRepository repository;

  const SetAppTheme({
    required this.repository,
  });

  Future<void> call(AppTheme theme) => repository.setTheme(theme);
}
