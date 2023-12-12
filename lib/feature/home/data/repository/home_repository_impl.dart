// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/feature/repository_manager/repository_manager.dart';

import '../../../../core/error/failures.dart';
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

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;
  final LanguageDataSource languageDataSource;
  final RepositoryHelper repositoryHelper;
  const HomeRepositoryImpl({
    required this.dataSource,
    required this.languageDataSource,
    required this.repositoryHelper,
  });

  @override
  Future<Either<Failure, List<Education>>> getEducations() =>
      repositoryHelper.tryToLoad(() => dataSource.getEducations(
            languageDataSource.getLanguageOrDefault.language,
          ));

  @override
  Future<Either<Failure, Info>> getInfo() =>
      repositoryHelper.tryToLoad(() async {
        final result = await dataSource
            .getInfo(languageDataSource.getLanguageOrDefault.language);
        final imageUrl = await dataSource.getImageUrl();
        return result.copyWith(imageUrl: imageUrl);
      });

  @override
  Future<Either<Failure, List<JobExperience>>> getJobExperiences() =>
      repositoryHelper.tryToLoad(
        () => dataSource.getJobExperiences(
          languageDataSource.getLanguageOrDefault.language,
        ),
      );

  @override
  Future<Either<Failure, Profession>> getProfession() =>
      repositoryHelper.tryToLoad(
        () => dataSource.getProfession(
          languageDataSource.getLanguageOrDefault.language,
        ),
      );

  @override
  Future<Either<Failure, List<Project>>> getProjects() =>
      repositoryHelper.tryToLoad(() => dataSource.getProjects(
            languageDataSource.getLanguageOrDefault.language,
          ));

  @override
  Future<Either<Failure, List<Skill>>> getSkills() =>
      repositoryHelper.tryToLoad(() => dataSource
          .getSkills(languageDataSource.getLanguageOrDefault.language));

  @override
  Future<Either<Failure, List<Software>>> getSoftwares() =>
      repositoryHelper.tryToLoad(() => dataSource
          .getSoftwares(languageDataSource.getLanguageOrDefault.language));

  @override
  Future<Either<Failure, void>> requestForExport(Uint8List image) =>
      repositoryHelper.tryToLoad(() => dataSource.requestForExport(image));
}
