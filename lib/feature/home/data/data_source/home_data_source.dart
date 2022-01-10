import '../../../../core/utils/top_level_functions.dart';
import '../../../../json_reader.dart';
import '../../domain/entity/education.dart';
import '../../domain/entity/info.dart';
import '../../domain/entity/job_experience.dart';
import '../../domain/entity/profession.dart';
import '../../domain/entity/project.dart';
import '../../domain/entity/skill.dart';
import '../../domain/entity/software.dart';
import '../model/education_model.dart';
import '../model/info_model.dart';
import '../model/job_experience_model.dart';
import '../model/profession_model.dart';
import '../model/project_model.dart';
import '../model/skill_model.dart';
import '../model/software_model.dart';

abstract class HomeDataSource {
  /// Get list of [Education] from fake api
  /// assets/api/language/education.json
  ///
  Future<List<Education>> getEducations(String language);

  /// Get [Info] from fake api
  /// assets/api/info.json
  ///
  Future<Info> getInfo(String language);

  /// Get list of [JobExperience] from fake api
  /// assets/api/language/job_experience.json
  ///
  Future<List<JobExperience>> getJobExperiences(String language);

  /// Get [Profession] from fake api
  /// assets/api/language/profession.json
  ///
  Future<Profession> getProfession(String language);

  /// Get list of [Project] from fake api
  /// assets/api/language/project.json
  ///
  Future<List<Project>> getProjects(String language);

  /// Get list of [Skill] from fake api
  /// assets/api/language/skill.json
  ///
  Future<List<Skill>> getSkills(String language);

  /// Get list of [Software] from fake api
  /// assets/api/language/software.json
  ///
  Future<List<Software>> getSoftwares(String language);
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<List<Education>> getEducations(String language) =>
      callApi<List<Education>>(
        converter: (json) =>
            (json as List).map((e) => EducationModel.fromJson(e)).toList(),
        request: () => readApi(
          'education',
          header: {
            'Language': language,
          },
        ),
      );

  @override
  Future<Info> getInfo(String language) => callApi<Info>(
        converter: (json) => InfoModel.fromJson(json),
        request: () => readApi(
          'info',
          header: {
            'Language': language,
          },
        ),
      );

  @override
  Future<List<JobExperience>> getJobExperiences(String language) =>
      callApi<List<JobExperience>>(
        converter: (json) =>
            (json as List).map((e) => JobExperienceModel.fromJson(e)).toList(),
        request: () => readApi(
          'job_experience',
          header: {
            'Language': language,
          },
        ),
      );

  @override
  Future<Profession> getProfession(String language) => callApi<Profession>(
        converter: (json) => ProfessionModel.fromJson(json),
        request: () => readApi(
          'profession',
          header: {
            'Language': language,
          },
        ),
      );

  @override
  Future<List<Project>> getProjects(String language) => callApi<List<Project>>(
        converter: (json) =>
            (json as List).map((e) => ProjectModel.fromJson(e)).toList(),
        request: () => readApi(
          'project',
          header: {
            'Language': language,
          },
        ),
      );
  @override
  Future<List<Skill>> getSkills(String language) => callApi<List<Skill>>(
        converter: (json) =>
            (json as List).map((e) => SkillModel.fromJson(e)).toList(),
        request: () => readApi(
          'skill',
          header: {
            'Language': language,
          },
        ),
      );
  @override
  Future<List<Software>> getSoftwares(String language) =>
      callApi<List<Software>>(
        converter: (json) =>
            (json as List).map((e) => SoftwareModel.fromJson(e)).toList(),
        request: () => readApi(
          'software',
          header: {
            'Language': language,
          },
        ),
      );
}
