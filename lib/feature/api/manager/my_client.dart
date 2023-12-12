import 'dart:convert';
import 'package:curl_generator/curl_generator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MyClient extends BaseClient {
  final Client delegate;

  MyClient(this.delegate);

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    Map<String, dynamic> body = {};
    if (request is Request && request.body.isNotEmpty) {
      body = json.decode(request.body);
    }
    final mLog = Curl.curlOf(
      url: request.url.toString(),
      body: body,
      method: request.method,
      header: request.headers,
    );
    debugPrint(
      '--------------------- Start Curl ---------------------\n'
      '$mLog\n'
      '--------------------- End Curl ---------------------',
    );
    return delegate.send(request);
  }

  @override
  void close() {
    delegate.close();
    super.close();
  }
}
