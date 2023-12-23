import 'package:portfolio/core/utils/extensions.dart';

import '../../domain/entity/education.dart';

class EducationModel extends Education {
  const EducationModel({
    required super.academicOrientation,
    required super.fromDate,
    required super.mainField,
    required super.school,
    required super.toDate,
    required super.fromDateJalali,
    required super.toDateJalali,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) => EducationModel(
        academicOrientation: json['academicOrientation'],
        mainField: json['mainField'],
        school: json['school'],
        fromDate: DateTime.parse(json['fromDate']),
        toDate: DateTime.parse(json['toDate']),
        fromDateJalali: json.toLocalJalali('fromDate'),
        toDateJalali: json.toLocalJalali('toDate'),
      );
}
