import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/utils/typedefs.dart';

abstract class ApiCaller {
  Future<T> callApi<T>({
    required ConvertToModel<T> converter,
    required Request request,
  });
}

@LazySingleton(as: ApiCaller)
class ApiCallerImpl implements ApiCaller {
  @override
  Future<T> callApi<T>({
    required ConvertToModel<T> converter,
    required Request request,
  }) async {
    final result = await request();
    String logString = result.request?.url.toString() ?? 'null';
    logString = '$logString\nStatusCode: ${result.statusCode.toString()}';
    final body = utf8.decode(result.bodyBytes);
    if (result.statusCode >= 200 && result.statusCode < 300) {
      logString = '$logString\n${body.isEmpty ? 'empty body' : body}';
      debugPrint(
        '--------------------- Start ---------------------\n'
        '$logString\n'
        '--------------------- End ---------------------',
      );
      dynamic decodedBody;
      try {
        decodedBody = json.decode(body);
      } on FormatException {
        decodedBody = body;
      }
      final decodedResult = body.isEmpty ? null : decodedBody;
      final bodyResult = converter(decodedResult);
      return bodyResult;
    }
    logString = '$logString \n $body';
    debugPrint(
      '--------------------- Start ---------------------\n'
      '$logString\n'
      '--------------------- End ---------------------',
    );
    // if (result.statusCode == 401) throw const UnAuthorizeException();
    final errorMessage = handleError(body);
    throw ServerException(message: errorMessage);
  }

  String? handleError(String body) {
    return null;
    // if (body.isEmpty) return null;
    // dynamic decodedBody;
    // try {
    //   decodedBody = json.decode(body);
    //   final item = ErrorModel.fromJson(decodedBody);
    //   return item.message.isEmpty ? null : item.message;
    // } on Exception {
    //   decodedBody = body;
    // }
    // return decodedBody?.toString();
  }
}
