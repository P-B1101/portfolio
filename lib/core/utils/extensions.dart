import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:portfolio/feature/provider/presentation/widgets/app_provider.dart';

extension MinMax on List<int> {
  int get minValue {
    if (isEmpty) return 0;
    int min = this[0];
    if (length == 1) return min;
    for (int i = 1; i < length; i++) {
      if (this[i] < min) min = this[i];
    }
    return min;
  }

  int get maxValue {
    if (isEmpty) return 0;
    int max = this[0];
    if (length == 1) return max;
    for (int i = 1; i < length; i++) {
      if (this[i] > max) max = this[i];
    }
    return max;
  }
}

extension StringExt on String {
  String get toPersianNumber => replaceAll('1', '۱')
      .replaceAll('2', '۲')
      .replaceAll('3', '۳')
      .replaceAll('4', '۴')
      .replaceAll('5', '۵')
      .replaceAll('6', '۶')
      .replaceAll('7', '۷')
      .replaceAll('8', '۸')
      .replaceAll('9', '۹')
      .replaceAll('0', '۰');

  String get toEnglishNumber => replaceAll('۱', '1')
      .replaceAll('۲', '2')
      .replaceAll('۳', '3')
      .replaceAll('۴', '4')
      .replaceAll('۵', '5')
      .replaceAll('۶', '6')
      .replaceAll('۷', '7')
      .replaceAll('۸', '8')
      .replaceAll('۹', '9')
      .replaceAll('۰', '0');

  String toEnglishNumberOrPersianNumber(BuildContext context) {
    final language = AppProvider.of(context).language;
    return switch (language.language) {
      'fa' => toPersianNumber,
      'en' => toEnglishNumber,
      _ => toEnglishNumber,
    };
  }

  Jalali? get toJalali {
    final dateTime = DateTime.tryParse(this)?.toLocal();
    if (dateTime == null) return null;
    return Jalali.fromDateTime(dateTime).copy(
      hour: dateTime.hour,
      minute: dateTime.minute,
      second: dateTime.second,
    );
  }

  Jalali? get toLocalJalali {
    final date = DateTime.tryParse(this)?.toLocal();
    if (date == null) return null;
    final jalali = Jalali.fromDateTime(date).copy(
      hour: date.hour,
      minute: date.minute,
      second: date.second,
    );
    return jalali;
  }

  bool get isValidEmail {
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(this);
  }

  Map<String, String> get getParams {
    Map<String, String> result = {};
    final params = split('&');
    for (int i = 0; i < params.length; i++) {
      final temp = params[i].split('=');
      final key = temp[0];
      final value = temp[1];
      result.putIfAbsent(key, () => value);
    }
    return result;
  }

  DateTime get toDate => DateTime.parse(this);
}

extension DateTimeExt on DateTime {}

extension MapStringDynamicExt on Map<String, dynamic> {
  Jalali? toJalali(String key) {
    final value = this[key];
    if (value is! String) return null;
    return value.toJalali;
  }

  Jalali? toLocalJalali(String key) {
    final value = this[key];
    if (value is! String) return null;
    return value.toLocalJalali;
  }

  T? toEnum<T extends Enum>(String key, T? Function(String value) converter) {
    final value = this[key];
    if (value is! String) return null;
    return converter(value);
  }

  T? toModel<T extends Equatable>(
    String key,
    T? Function(dynamic value) converter,
  ) {
    final value = this[key];
    if (value == null) return null;
    return converter(value);
  }

  List<T> toListModel<T extends Equatable>(
    String key,
    T Function(dynamic value) converter,
  ) {
    final value = this[key];
    if (value is! List) return <T>[];
    return value.map((e) => converter(e)).toList();
  }

  Color toColor(String key) => Color(int.parse('FF${this[key]}', radix: 16));
}
