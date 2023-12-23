import 'package:equatable/equatable.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class Project extends Equatable {
  final String title;
  final String subtitle;
  final DateTime date;
  final Jalali? dateJalali;
  final String androidLink;
  final String iosLink;
  final String webAppLink;

  const Project({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.androidLink,
    required this.iosLink,
    required this.webAppLink,
    required this.dateJalali,
  });

  @override
  List<Object?> get props => [
        title,
        subtitle,
        date,
        androidLink,
        iosLink,
        webAppLink,
      ];

  bool get hasAndroidLink => androidLink.isNotEmpty;

  bool get hasiOSLink => iosLink.isNotEmpty;

  bool get hasWebLink => webAppLink.isNotEmpty;
}
