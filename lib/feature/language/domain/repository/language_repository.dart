import '../../data/models/app_language_model.dart';
import '../entities/app_language.dart';

abstract class LanguageRepository {
  /// save [AppLanguage] that user selected.
  ///
  Future<void> setLanguage(AppLanguage language);

  /// return [AppLanguage] that saved.
  ///
  /// return [AppLanguageModel.defaultLanguage] in nothing saved.
  ///
  AppLanguage get getLanguage;
}
