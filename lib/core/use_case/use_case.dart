import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<ResponseType, ParamType extends NoParams> {
  const UseCase();

  Future<Either<Failure, ResponseType>> call(ParamType params);
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object?> get props => [];
}
