import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/software.dart';
import '../repository/home_repository.dart';

class GetSoftwares extends UseCase<List<Software>, NoParams> {
  final HomeRepository repository;
  const GetSoftwares({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Software>>> call(NoParams params) =>
      repository.getSoftwares();
}
