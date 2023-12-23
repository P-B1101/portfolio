import 'package:portfolio/core/utils/extensions.dart';

import '../../domain/entity/job_experience.dart';

class JobExperienceModel extends JobExperience {
  const JobExperienceModel({
    required super.company,
    required super.title,
    required super.fromDate,
    required super.toDate,
    required super.isContinue,
    required super.fromDateJalali,
    required super.toDateJalali,
  });

  factory JobExperienceModel.fromJson(Map<String, dynamic> json) =>
      JobExperienceModel(
        company: json['company'],
        title: json['title'],
        isContinue: json['isContinue'],
        fromDate: DateTime.parse(json['fromDate']),
        toDate: DateTime.parse(json['toDate']),
        fromDateJalali: json.toLocalJalali('fromDate'),
        toDateJalali: json.toLocalJalali('toDate'),
      );
}
