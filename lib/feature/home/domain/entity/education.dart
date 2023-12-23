import 'package:equatable/equatable.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class Education extends Equatable {
  final String mainField;
  final String academicOrientation;
  final String school;
  final DateTime fromDate;
  final DateTime toDate;
  final Jalali? fromDateJalali;
  final Jalali? toDateJalali;
  const Education({
    required this.academicOrientation,
    required this.fromDate,
    required this.mainField,
    required this.school,
    required this.toDate,
    required this.fromDateJalali,
    required this.toDateJalali,
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
