import '../../domain/entities/app_language.dart';

class AppLanguageModel extends AppLanguage {
  const AppLanguageModel({
    required String language,
  }) : super(language: language);

  factory AppLanguageModel.fromString(String language) =>
      AppLanguageModel(language: language);

  factory AppLanguageModel.defaultLanguage() =>
      const AppLanguageModel(language: 'en');
}
