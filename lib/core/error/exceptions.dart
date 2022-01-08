import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Throw this exception in DataSource if API return failure response.
///
class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException({this.message});

  @override
  List<Object?> get props => [message];
}

/// Throw this exception if there is no [AppTheme.interval] saved
///
/// in [SharedPreferences]
///
class NoThemeSavedException extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

/// Throw this exception if there is no [AppLanguage.language] saved
///
/// in [SharedPreferences]
///
class NoLanguageSavedException extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}