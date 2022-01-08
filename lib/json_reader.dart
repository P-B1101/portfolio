
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future<http.Response> readApi<T>(String url) =>
    rootBundle.loadStructuredData<http.Response>(
      'assets/api/$url.json',
      (response) async => http.Response(response, 200),
    );
