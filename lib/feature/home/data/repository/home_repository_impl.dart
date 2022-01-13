// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/typedefs.dart';
import '../../../language/data/data_sources/language_data_source.dart';
import '../../domain/entity/education.dart';
import '../../domain/entity/info.dart';
import '../../domain/entity/job_experience.dart';
import '../../domain/entity/profession.dart';
import '../../domain/entity/project.dart';
import '../../domain/entity/skill.dart';
import '../../domain/entity/software.dart';
import '../../domain/repository/home_repository.dart';
import '../data_source/home_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;
  final LanguageDataSource languageDataSource;
  const HomeRepositoryImpl({
    required this.dataSource,
    required this.languageDataSource,
  });

  Future<Either<Failure, T>> _loadOrFail<T>(
    LoadOrFail<T> loadOrFail,
    String method,
  ) async {
    // if (!(await networkInfo.isConnected))
    // return Left(NoInternetConnectionFailure());
    try {
      final result = await loadOrFail();
      return Right(result);
    } on ServerException catch (error) {
      print(method);
      print(error.toString());
      return Left(ServerFailure(message: error.message));
    } on SocketException catch (error) {
      print(method);
      print(error.toString());
      return const Left(ServerFailure());
    } on ClientException catch (error) {
      print(method);
      print(error.toString());
      return const Left(ServerFailure());
    } on Exception catch (error) {
      print(method);
      print(error.toString());
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Education>>> getEducations() =>
      _loadOrFail<List<Education>>(
        () => dataSource
            .getEducations(languageDataSource.getLanguageOrDefault.language),
        'getEducations',
      );

  @override
  Future<Either<Failure, Info>> getInfo() => _loadOrFail<Info>(
        () => dataSource
            .getInfo(languageDataSource.getLanguageOrDefault.language),
        'getInfo',
      );

  @override
  Future<Either<Failure, List<JobExperience>>> getJobExperiences() =>
      _loadOrFail<List<JobExperience>>(
        () => dataSource.getJobExperiences(
            languageDataSource.getLanguageOrDefault.language),
        'getJobExperiences',
      );

  @override
  Future<Either<Failure, Profession>> getProfession() =>
      _loadOrFail<Profession>(
        () => dataSource
            .getProfession(languageDataSource.getLanguageOrDefault.language),
        'getProfession',
      );

  @override
  Future<Either<Failure, List<Project>>> getProjects() =>
      _loadOrFail<List<Project>>(
        () => dataSource
            .getProjects(languageDataSource.getLanguageOrDefault.language),
        'getProjects',
      );

  @override
  Future<Either<Failure, List<Skill>>> getSkills() => _loadOrFail<List<Skill>>(
        () => dataSource
            .getSkills(languageDataSource.getLanguageOrDefault.language),
        'getSkills',
      );

  @override
  Future<Either<Failure, List<Software>>> getSoftwares() =>
      _loadOrFail<List<Software>>(
        () => dataSource
            .getSoftwares(languageDataSource.getLanguageOrDefault.language),
        'getSoftwares',
      );
}
