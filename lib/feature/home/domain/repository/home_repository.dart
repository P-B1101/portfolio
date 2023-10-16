import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/education.dart';
import '../entity/info.dart';
import '../entity/job_experience.dart';
import '../entity/profession.dart';
import '../entity/project.dart';
import '../entity/skill.dart';
import '../entity/software.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Education>>> getEducations();

  Future<Either<Failure, Info>> getInfo();

  Future<Either<Failure, List<JobExperience>>> getJobExperiences();

  Future<Either<Failure, Profession>> getProfession();

  Future<Either<Failure, List<Project>>> getProjects();

  Future<Either<Failure, List<Skill>>> getSkills();

  Future<Either<Failure, List<Software>>> getSoftwares();

  Future<Either<Failure, void>> requestForExport(Uint8List image);
}
