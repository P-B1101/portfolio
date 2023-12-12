import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/job_experience.dart';
import '../repository/home_repository.dart';

@lazySingleton
class GetJobExperiences extends UseCase<List<JobExperience>, NoParams> {
  final HomeRepository repository;
  const GetJobExperiences({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<JobExperience>>> call(NoParams params) =>
      repository.getJobExperiences();
}
