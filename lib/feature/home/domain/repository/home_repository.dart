import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/education.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Education>>> getEducations();
}
