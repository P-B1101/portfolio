import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/skill.dart';
import '../repository/home_repository.dart';

class GetSkills extends UseCase<List<Skill>, NoParams> {
  final HomeRepository repository;
  const GetSkills({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Skill>>> call(NoParams params) =>
      repository.getSkills();
}
