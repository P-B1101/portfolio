import '../../../../core/utils/top_level_functions.dart';
import '../../../../json_reader.dart';
import '../../domain/entity/education.dart';
import '../model/education_model.dart';

abstract class HomeDataSource {
  /// Get list of [Education] from fake api
  /// assets/api/education.json
  ///
  Future<List<Education>> getEducations();
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<List<Education>> getEducations() => callApi(
        converter: (json) =>
            (json as List).map((e) => EducationModel.fromJson(e)).toList(),
        request: () => readApi('education'),
      );
}
