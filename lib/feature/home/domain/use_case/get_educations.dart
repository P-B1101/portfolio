import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/education.dart';
import '../repository/home_repository.dart';

class GetEducations extends UseCase<List<Education>, NoParams> {
  final HomeRepository repository;
  const GetEducations({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Education>>> call(NoParams params) =>
      repository.getEducations();
}
