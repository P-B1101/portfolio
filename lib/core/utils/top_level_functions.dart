import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../error/exceptions.dart';
import 'typedefs.dart';

Future<T> callApi<T>({
  required ConvertToModel<T> converter,
  required Request request,
  bool isFile = false,
}) async {
  final result = await request();
  // final fileResponse = isFile ? result : null;
  final response = result.body.isEmpty ? null : json.decode(result.body);
  // if (result.statusCode == 401) throw UnAuhtorizeException();
  if (result.statusCode >= 200 && result.statusCode < 300) {
    // return converter(isFile ? fileResponse : response);
    return converter(response);
  }
  // final error = response == null ? null : ErrorModel.fromJson(response);
  // final message = error?.title;
  throw const ServerException(
      // message: message == null || message.isEmpty ? null : message,
      );
}

final isWebMobile = kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android);
