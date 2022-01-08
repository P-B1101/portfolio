import 'package:equatable/equatable.dart';

/// entity for save selected language.
/// 
class AppLanguage extends Equatable {
  final String language;

  const AppLanguage({
    required this.language,
  });

  @override
  List<Object?> get props => [
        language,
      ];
}
