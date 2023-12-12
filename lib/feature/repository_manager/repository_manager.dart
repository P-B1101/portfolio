import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/utils/typedefs.dart';

abstract class RepositoryHelper {
  Future<Either<Failure, T>> tryToLoad<T>(LoadOrFail<T> loadOrFail);
}

@LazySingleton(as: RepositoryHelper)
class RepositoryHelperImpl implements RepositoryHelper {
  const RepositoryHelperImpl();

  @override
  Future<Either<Failure, T>> tryToLoad<T>(LoadOrFail<T> loadOrFail) async =>
      _tryToLoad(() async => await loadOrFail());

  Future<Either<Failure, T>> _tryToLoad<T>(
    Future<T> Function() tryToLoad,
  ) async {
    try {
      return Right(await tryToLoad());
    } on ServerException catch (error) {
      debugPrint(error.toString());
      return Left(ServerFailure(message: error.message));
    } on SocketException catch (error) {
      debugPrint(error.toString());
      return const Left(ServerFailure());
    } on ClientException catch (error) {
      debugPrint(error.toString());
      return const Left(ServerFailure());
    } on Exception catch (error) {
      debugPrint(error.toString());
      return const Left(ServerFailure());
    }
  }
}
