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
import 'package:http/http.dart' as http;

abstract class HomeDataSource {
  /// Get list of [Education] from api
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Feducation.json?alt=media&token=fd9c67cc-b756-49a3-999e-d7fed3c67957 for en
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Feducation.json?alt=media&token=778766e9-3916-4dea-8c4b-efa3f74117ef for fa
  ///
  Future<List<Education>> getEducations(String language);

  /// Get [Info] from fake api
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Finfo.json?alt=media&token=b788f284-8536-42b3-9771-f3ecb5dce931 for en
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Finfo.json?alt=media&token=29c630b9-8e90-4a96-90df-90611f6d5c3a for fa
  ///
  Future<Info> getInfo(String language);

  /// Get list of [JobExperience] from fake api
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Fjob_experience.json?alt=media&token=aea0ee60-e012-491d-b1d1-73bb4c0207ba for en
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Fjob_experience.json?alt=media&token=ddd17b1a-e4c1-4340-8548-35aa9d029d3b for fa
  ///
  Future<List<JobExperience>> getJobExperiences(String language);

  /// Get [Profession] from fake api
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Fprofession.json?alt=media&token=6df0f682-719c-48c7-9e0f-c435cb26d6b4 for en
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Fprofession.json?alt=media&token=1ed20ecf-7be9-42cc-abee-3437bfb4f617 for fa
  ///
  Future<Profession> getProfession(String language);

  /// Get list of [Project] from fake api
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Fproject.json?alt=media&token=63dafbd3-2ecd-4c85-a59e-d7e075ec00df for en
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Feducation.json?alt=media&token=778766e9-3916-4dea-8c4b-efa3f74117ef for fa
  ///
  Future<List<Project>> getProjects(String language);

  /// Get list of [Skill] from fake api
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Fskill.json?alt=media&token=7ed2c81a-70ce-416e-a83b-b73cea2db4bd for en
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Fskill.json?alt=media&token=f2fe7dce-6fa7-401e-abb2-5629e27725cb for fa
  ///
  Future<List<Skill>> getSkills(String language);

  /// Get list of [Software] from fake api
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Fsoftware.json?alt=media&token=ace0f591-722a-445a-a754-39d58b615761 for en
  ///  https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Fsoftware.json?alt=media&token=28232891-95d9-4d63-851b-ed4ce873b201 for fa
  ///
  Future<List<Software>> getSoftwares(String language);
}

class HomeDataSourceImpl implements HomeDataSource {
  final http.Client client;
  const HomeDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<Education>> getEducations(String language) {
    final uri = Uri.parse(
      language == 'en'
          ? 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Feducation.json?alt=media&token=fd9c67cc-b756-49a3-999e-d7fed3c67957'
          : 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Feducation.json?alt=media&token=778766e9-3916-4dea-8c4b-efa3f74117ef',
    );
    return callApi<List<Education>>(
      converter: (json) =>
          (json as List).map((e) => EducationModel.fromJson(e)).toList(),
      request: () => client.get(uri),
    );
  }

  @override
  Future<Info> getInfo(String language) {
    final uri = Uri.parse(
      language == 'en'
          ? 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Finfo.json?alt=media&token=b788f284-8536-42b3-9771-f3ecb5dce931'
          : 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Finfo.json?alt=media&token=29c630b9-8e90-4a96-90df-90611f6d5c3a',
    );
    return callApi<Info>(
      converter: (json) => InfoModel.fromJson(json),
      request: () => client.get(uri),
    );
  }

  @override
  Future<List<JobExperience>> getJobExperiences(String language) {
    final uri = Uri.parse(
      language == 'en'
          ? 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Fjob_experience.json?alt=media&token=aea0ee60-e012-491d-b1d1-73bb4c0207ba'
          : 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Fjob_experience.json?alt=media&token=ddd17b1a-e4c1-4340-8548-35aa9d029d3b',
    );
    return callApi<List<JobExperience>>(
      converter: (json) =>
          (json as List).map((e) => JobExperienceModel.fromJson(e)).toList(),
      request: () => client.get(uri),
    );
  }

  @override
  Future<Profession> getProfession(String language) {
    final uri = Uri.parse(
      language == 'en'
          ? 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Fprofession.json?alt=media&token=6df0f682-719c-48c7-9e0f-c435cb26d6b4'
          : 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Fprofession.json?alt=media&token=1ed20ecf-7be9-42cc-abee-3437bfb4f617',
    );
    return callApi<Profession>(
      converter: (json) => ProfessionModel.fromJson(json),
      request: () => client.get(uri),
    );
  }

  @override
  Future<List<Project>> getProjects(String language) {
    final uri = Uri.parse(
      language == 'en'
          ? 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Fproject.json?alt=media&token=63dafbd3-2ecd-4c85-a59e-d7e075ec00df'
          : 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Feducation.json?alt=media&token=778766e9-3916-4dea-8c4b-efa3f74117ef',
    );
    return callApi<List<Project>>(
      converter: (json) =>
          (json as List).map((e) => ProjectModel.fromJson(e)).toList(),
      request: () => client.get(uri),
    );
  }

  @override
  Future<List<Skill>> getSkills(String language) {
    final uri = Uri.parse(
      language == 'en'
          ? 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Fskill.json?alt=media&token=7ed2c81a-70ce-416e-a83b-b73cea2db4bd'
          : 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Fskill.json?alt=media&token=f2fe7dce-6fa7-401e-abb2-5629e27725cb',
    );
    return callApi<List<Skill>>(
      converter: (json) =>
          (json as List).map((e) => SkillModel.fromJson(e)).toList(),
      request: () => client.get(uri),
    );
  }

  @override
  Future<List<Software>> getSoftwares(String language) {
    final uri = Uri.parse(
      language == 'en'
          ? 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Fen%2Fsoftware.json?alt=media&token=ace0f591-722a-445a-a754-39d58b615761'
          : 'https://firebasestorage.googleapis.com/v0/b/b1101-portfolio.appspot.com/o/api%2Ffa%2Fsoftware.json?alt=media&token=28232891-95d9-4d63-851b-ed4ce873b201',
    );
    return callApi<List<Software>>(
      converter: (json) =>
          (json as List).map((e) => SoftwareModel.fromJson(e)).toList(),
      request: () => client.get(uri),
    );
  }
}
