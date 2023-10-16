import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Strings {
  Strings._privateConstructor();

  static final Strings _instance = Strings._privateConstructor();

  factory Strings() => _instance;

  static AppLocalizations of(BuildContext context) => AppLocalizations.of(context)!;
}
