import 'package:equatable/equatable.dart';

class Education extends Equatable {
  final String mainField;
  final String academicOrientation;
  final String school;
  final DateTime fromDate;
  final DateTime toDate;
  const Education({
    required this.academicOrientation,
    required this.fromDate,
    required this.mainField,
    required this.school,
    required this.toDate,
  });
  @override
  List<Object?> get props => [
        mainField,
        academicOrientation,
        school,
        fromDate,
        toDate,
      ];
}
