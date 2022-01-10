import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/project.dart';
import '../repository/home_repository.dart';

class GetProjects extends UseCase<List<Project>, NoParams> {
  final HomeRepository repository;
  const GetProjects({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Project>>> call(NoParams params) =>
      repository.getProjects();
}
