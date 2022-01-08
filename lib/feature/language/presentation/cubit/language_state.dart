part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final AppLanguage language;
  const LanguageState({
    required this.language,
  });

  @override
  List<Object> get props => [
        language,
      ];
}
