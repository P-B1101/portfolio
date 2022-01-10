import 'package:equatable/equatable.dart';

class JobExperience extends Equatable {
  final String company;
  final String title;
  final DateTime fromDate;
  final DateTime toDate;
  final bool isContinue;

  const JobExperience({
    required this.company,
    required this.title,
    required this.fromDate,
    required this.toDate,
    required this.isContinue,
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
