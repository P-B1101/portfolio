import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/app_language.dart';
import '../../domain/repository/language_repository.dart';
import '../data_sources/language_data_source.dart';
import '../models/app_language_model.dart';

@LazySingleton(as: LanguageRepository)
class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageDataSource dataSource;

  const LanguageRepositoryImpl({
    required this.dataSource,
  });

  @override
  AppLanguage get getLanguage {
    try {
      return dataSource.getLanguage;
    } on NoLanguageSavedException {
      return AppLanguageModel.defaultLanguage();
    }
  }

  @override
  Future<void> setLanguage(AppLanguage language) =>
      dataSource.setLanguage(language);
}
