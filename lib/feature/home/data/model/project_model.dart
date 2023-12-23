import 'package:portfolio/core/utils/extensions.dart';

import '../../domain/entity/project.dart';

class ProjectModel extends Project {
  const ProjectModel({
    required super.title,
    required super.subtitle,
    required super.date,
    required super.androidLink,
    required super.iosLink,
    required super.webAppLink,
    required super.dateJalali,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        title: json['title'],
        subtitle: json['subtitle'],
        date: DateTime.parse(json['date']),
        androidLink: json['androidLink'] ?? '',
        iosLink: json['iosLink'] ?? '',
        webAppLink: json['webLink'] ?? '',
        dateJalali: json.toLocalJalali('date'),
      );
}
