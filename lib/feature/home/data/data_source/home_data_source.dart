import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

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
  /// Get list of [Education]
  /// [firebase_storage.FirebaseStorage]
  ///
  Future<List<Education>> getEducations(String language);

  /// Get [Info] from
  /// [firebase_storage.FirebaseStorage]
  ///
  Future<Info> getInfo(String language);

  /// Get list of [JobExperience] from
  /// [firebase_storage.FirebaseStorage]
  ///
  Future<List<JobExperience>> getJobExperiences(String language);

  /// Get [Profession] from
  /// [firebase_storage.FirebaseStorage]
  ///
  Future<Profession> getProfession(String language);

  /// Get list of [Project] from
  /// [firebase_storage.FirebaseStorage]
  ///
  Future<List<Project>> getProjects(String language);

  /// Get list of [Skill] from
  /// [firebase_storage.FirebaseStorage]
  ///
  Future<List<Skill>> getSkills(String language);

  /// Get list of [Software] from
  /// [firebase_storage.FirebaseStorage]
  ///
  Future<List<Software>> getSoftwares(String language);

  /// Get Image URL from
  /// [firebase_storage.FirebaseStorage]
  ///
  Future<String> getImageUrl();

  Future<void> requestForExport(Uint8List image);
}

class HomeDataSourceImpl implements HomeDataSource {
  // final http.Client client;
  // final firebase_storage.FirebaseStorage storage;
  final FilePicker picker;
  const HomeDataSourceImpl({
    // required this.client,
    // required this.storage,
    required this.picker,
  });

  @override
  Future<List<Education>> getEducations(String language) async {
    // final educations = storage.ref('api/$language/education.json');
    // final url = await educations.getDownloadURL();
    return callApi<List<Education>>(
      converter: (json) =>
          (json as List).map((e) => EducationModel.fromJson(e)).toList(),
      request: () => readApi(
        'education',
        header: {
          'Language': language,
        },
      ),
    );
  }

  @override
  Future<Info> getInfo(String language) async {
    // final educations = storage.ref('api/$language/info.json');
    // final url = await educations.getDownloadURL();
    return callApi<Info>(
      converter: (json) => InfoModel.fromJson(json),
      request: () => readApi(
        'info',
        header: {
          'Language': language,
        },
      ),
    );
  }

  @override
  Future<List<JobExperience>> getJobExperiences(String language) async {
    // final educations = storage.ref('api/$language/job_experience.json');
    // final url = await educations.getDownloadURL();
    return callApi<List<JobExperience>>(
      converter: (json) =>
          (json as List).map((e) => JobExperienceModel.fromJson(e)).toList(),
      request: () => readApi(
        'job_experience',
        header: {
          'Language': language,
        },
      ),
    );
  }

  @override
  Future<Profession> getProfession(String language) async {
    // final educations = storage.ref('api/$language/profession.json');
    // final url = await educations.getDownloadURL();
    return callApi<Profession>(
      converter: (json) => ProfessionModel.fromJson(json),
      request: () => readApi(
        'profession',
        header: {
          'Language': language,
        },
      ),
    );
  }

  @override
  Future<List<Project>> getProjects(String language) async {
    // final educations = storage.ref('api/$language/project.json');
    // final url = await educations.getDownloadURL();
    return callApi<List<Project>>(
      converter: (json) =>
          (json as List).map((e) => ProjectModel.fromJson(e)).toList(),
      request: () => readApi(
        'project',
        header: {
          'Language': language,
        },
      ),
    );
  }

  @override
  Future<List<Skill>> getSkills(String language) async {
    // final educations = storage.ref('api/$language/skill.json');
    // final url = await educations.getDownloadURL();
    return callApi<List<Skill>>(
      converter: (json) =>
          (json as List).map((e) => SkillModel.fromJson(e)).toList(),
      request: () => readApi(
        'skill',
        header: {
          'Language': language,
        },
      ),
    );
  }

  @override
  Future<List<Software>> getSoftwares(String language) async {
    // final educations = storage.ref('api/$language/software.json');
    // final url = await educations.getDownloadURL();
    return callApi<List<Software>>(
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

  @override
  Future<String> getImageUrl() async {
    // final educations = storage.ref('/image/pedram.jpg');
    // final url = await educations.getDownloadURL();
    // return url;
    return 'assets/images/png/pedram.jpg';
  }

  @override
  Future<void> requestForExport(Uint8List image) async {
    final extensions = ['png'];
    final saveDir = await picker.saveFile(
      allowedExtensions: extensions,
      type: FileType.custom,
      fileName: 'cv.png',
    );
    if (saveDir == null) return;
    final newFile = await File(saveDir).create();
    await newFile.writeAsBytes(image);
  }
}
