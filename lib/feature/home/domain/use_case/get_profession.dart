import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/profession.dart';
import '../repository/home_repository.dart';

@lazySingleton
class GetProfession extends UseCase<Profession, NoParams> {
  final HomeRepository repository;
  const GetProfession({
    required this.repository,
  });

  @override
  Future<Either<Failure, Profession>> call(NoParams params) =>
      repository.getProfession();
}
