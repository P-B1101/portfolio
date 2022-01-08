import 'package:http/http.dart';

typedef ConvertToModel<T> = T Function(dynamic body);
typedef Request = Future<Response> Function();

typedef LoadOrFail<T> = Future<T> Function();
