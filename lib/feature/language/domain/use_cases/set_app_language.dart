import 'package:injectable/injectable.dart';

import '../entities/app_language.dart';
import '../repository/language_repository.dart';

/// Save [AppLanguage] that user selected
///
/// uning [LanguageRepository].
///

@lazySingleton
class SetAppLanguage {
  final LanguageRepository repository;

  const SetAppLanguage({
    required this.repository,
  });

  Future<void> call(AppLanguage language) => repository.setLanguage(language);
}
