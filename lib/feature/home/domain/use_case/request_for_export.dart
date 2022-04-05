import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../repository/home_repository.dart';

class RequestForExport extends UseCase<void, Params> {
  final HomeRepository repository;
  const RequestForExport({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) =>
      repository.requestForExport(params.image);
}

class Params extends NoParams {
  final Uint8List image;
  const Params({
    required this.image,
  });

  @override
  List<Object?> get props => [image];
}
