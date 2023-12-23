import 'package:equatable/equatable.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class JobExperience extends Equatable {
  final String company;
  final String title;
  final DateTime fromDate;
  final DateTime toDate;
  final Jalali? fromDateJalali;
  final Jalali? toDateJalali;
  final bool isContinue;

  const JobExperience({
    required this.company,
    required this.title,
    required this.fromDate,
    required this.toDate,
    required this.isContinue,
    required this.fromDateJalali,
    required this.toDateJalali,
  });

  @override
  List<Object?> get props => [
        company,
        title,
        fromDate,
        toDate,
        isContinue,
      ];
}
