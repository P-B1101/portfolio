import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'injection_container.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async {
  getIt.init();
}

@module
abstract class RegisterHttpClient {
  @lazySingleton
  http.Client get client => http.Client();
}

@module
abstract class RegisterSharedPref {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

@module
abstract class RegisterFToast {
  @lazySingleton
  FToast get tosat => FToast();
}

@module
abstract class RegisterFilePicker {
  @lazySingleton
  FilePicker get tosat => FilePicker.platform;
}

@module
abstract class RegisterFileSaver {
  FileSaver get tosat => FileSaver.instance;
}
