import '../../data/models/app_language_model.dart';
import '../entities/app_language.dart';
import '../repository/language_repository.dart';

/// Request for saved[AppLanguage] from [LanguageRepository].
///
/// Return [AppLanguageModel.defaultLanguage] if nothing saved.
///
class GetAppLanguage {
  final LanguageRepository repository;

  const GetAppLanguage({
    required this.repository,
  });

  AppLanguage call() => repository.getLanguage;
}
