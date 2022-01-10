import '../../domain/entity/project.dart';

class ProjectModel extends Project {
  const ProjectModel({
    required String title,
    required String subtitle,
    required DateTime date,
    required String? androidLink,
    required String? iosLink,
    required String? webAppLink,
  }) : super(
          androidLink: androidLink,
          date: date,
          iosLink: iosLink,
          subtitle: subtitle,
          title: title,
          webAppLink: webAppLink,
        );

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        title: json['title'],
        subtitle: json['subtitle'],
        date: DateTime.parse(json['date']),
        androidLink: json['androidLink'],
        iosLink: json['iosLink'],
        webAppLink: json['webLink'],
      );
}
