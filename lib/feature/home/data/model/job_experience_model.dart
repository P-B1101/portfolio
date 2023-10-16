import '../../domain/entity/job_experience.dart';

class JobExperienceModel extends JobExperience {
  const JobExperienceModel({
    required String company,
    required String title,
    required DateTime fromDate,
    required DateTime toDate,
    required bool isContinue,
  }) : super(
          company: company,
          fromDate: fromDate,
          isContinue: isContinue,
          title: title,
          toDate: toDate,
        );

  factory JobExperienceModel.fromJson(Map<String, dynamic> json) =>
      JobExperienceModel(
        company: json['company'],
        title: json['title'],
        isContinue: json['isContinue'],
        fromDate: DateTime.parse(json['fromDate']),
        toDate: DateTime.parse(json['toDate']),
      );
}
