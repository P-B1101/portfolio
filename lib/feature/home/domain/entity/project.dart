import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String title;
  final String subtitle;
  final DateTime date;
  final String? androidLink;
  final String? iosLink;
  final String? webAppLink;

  const Project({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.androidLink,
    required this.iosLink,
    required this.webAppLink,
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
}
