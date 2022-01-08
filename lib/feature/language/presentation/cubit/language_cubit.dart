import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/app_language_model.dart';
import '../../domain/entities/app_language.dart';
import '../../domain/use_cases/get_app_language.dart';
import '../../domain/use_cases/set_app_language.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final GetAppLanguage getAppLanguage;
  final SetAppLanguage setAppLanguage;

  LanguageCubit({
    required this.getAppLanguage,
    required this.setAppLanguage,
  }) : super(LanguageState(language: getAppLanguage()));

  /// Save [language] using [SetAppLanguage] usecase
  /// and emit it.
  ///
  set setApplicationLanguage(String language) {
    final appLanguage = AppLanguageModel.fromString(language);
    setAppLanguage(appLanguage);
    emit(LanguageState(language: appLanguage));
  }
}
