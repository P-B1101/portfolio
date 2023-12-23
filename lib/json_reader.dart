import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/core/error/exceptions.dart';

Future<http.Response> readApi<T>(
  String url, {
  Map<String, String>? header,
}) async {
  final subFolder = header != null && header['Language'] == 'fa' ? 'fa' : 'en';
  return rootBundle.loadStructuredData<http.Response>(
    'assets/api/$subFolder/$url.json',
    (response) async {
      try {
        final encodedData = const Utf8Codec().encode(response);
        final result = http.Response.bytes(
          encodedData,
          200,
          headers: header ?? {},
          request: http.Request(
            'GET',
            Uri.parse(
              'assets/api/$subFolder/$url.json',
            ),
          ),
        );
        debugPrint(result.body);
        return result;
      } catch (error) {
        throw ServerException(message: error.toString());
      }
    },
  );
}
