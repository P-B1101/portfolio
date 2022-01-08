// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/exceptions.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/utils/typedefs.dart';
import 'package:portfolio/feature/home/data/data_source/home_data_source.dart';
import 'package:portfolio/feature/home/domain/entity/education.dart';
import 'package:portfolio/feature/home/domain/repository/home_repository.dart';
import 'package:http/http.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  const HomeRepositoryImpl({
    required this.dataSource,
  });

  Future<Either<Failure, T>> _loadOrFail<T>(LoadOrFail<T> loadOrFail) async {
    // if (!(await networkInfo.isConnected))
    // return Left(NoInternetConnectionFailure());
    try {
      final result = await loadOrFail();
      return Right(result);
    } on ServerException catch (error) {
      print(error.toString());
      return Left(ServerFailure(message: error.message));
    } on SocketException catch (error) {
      print(error.toString());
      return const Left(ServerFailure());
    } on ClientException catch (error) {
      print(error.toString());
      return const Left(ServerFailure());
    } on Exception catch (error) {
      print(error.toString());
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Education>>> getEducations() =>
      _loadOrFail(() => dataSource.getEducations());
}
