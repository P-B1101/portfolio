import '../../domain/entity/education.dart';

class EducationModel extends Education {
  const EducationModel({
    required String academicOrientation,
    required DateTime fromDate,
    required String mainField,
    required String school,
    required DateTime toDate,
  }) : super(
          academicOrientation: academicOrientation,
          fromDate: fromDate,
          mainField: mainField,
          school: school,
          toDate: toDate,
        );

  factory EducationModel.fromJson(Map<String, dynamic> json) => EducationModel(
        academicOrientation: json['academicOrientation'],
        fromDate: DateTime.parse(json['fromDate']),
        mainField: json['mainField'],
        school: json['school'],
        toDate: DateTime.parse(json['toDate']),
      );
}
