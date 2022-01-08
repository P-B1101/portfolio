import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/app_language.dart';
import '../models/app_language_model.dart';

abstract class LanguageDataSource {
  /// save user selected Language in [SharedPreferences]
  ///
  Future<void> setLanguage(AppLanguage language);

  /// get user selected Language from [SharedPreferences]
  ///
  /// throw [NoLanguageSavedException] if nothing found.
  ///
  AppLanguage get getLanguage;
}

const LANGUAGE_KEY = 'LanguageKey';

class LanguageDataSourceImpl implements LanguageDataSource {
  final SharedPreferences localStorage;

  const LanguageDataSourceImpl({
    required this.localStorage,
  });

  @override
  Future<void> setLanguage(AppLanguage language) =>
      localStorage.setString(LANGUAGE_KEY, language.language);

  @override
  AppLanguage get getLanguage {
    final language = localStorage.getString(LANGUAGE_KEY);
    if (language == null) throw NoLanguageSavedException();
    return AppLanguageModel.fromString(language);
  }
}
