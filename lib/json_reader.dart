import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future<http.Response> readApi<T>(
  String url, {
  Map<String, String>? header,
}) async {
  final subFolder = header != null && header['Language'] == 'fa' ? 'fa' : 'en';
  return rootBundle.loadStructuredData<http.Response>(
    '/api/$subFolder/$url.json',
    (response) async => http.Response(response, 200),
  );
}
