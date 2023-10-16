import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/info.dart';
import '../repository/home_repository.dart';

class GetInfo extends UseCase<Info, NoParams> {
  final HomeRepository repository;
  const GetInfo({
    required this.repository,
  });

  @override
  Future<Either<Failure, Info>> call(NoParams params) => repository.getInfo();
}
