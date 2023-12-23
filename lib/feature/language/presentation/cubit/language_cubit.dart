import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/app_language_model.dart';
import '../../domain/entities/app_language.dart';
import '../../domain/use_cases/get_app_language.dart';
import '../../domain/use_cases/set_app_language.dart';

part 'language_state.dart';

@injectable
class LanguageCubit extends Cubit<LanguageState> {
  final SetAppLanguage _setAppLanguage;

  LanguageCubit({
    required GetAppLanguage getAppLanguage,
    required SetAppLanguage setAppLanguage,
  })  : _setAppLanguage = setAppLanguage,
        super(LanguageState(language: getAppLanguage()));

  /// Save [language] using [SetAppLanguage] usecase
  /// and emit it.
  ///
  set setApplicationLanguage(String language) {
    final appLanguage = AppLanguageModel.fromString(language);
    _setAppLanguage(appLanguage);
    emit(LanguageState(language: appLanguage));
  }
}
