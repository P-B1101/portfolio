import '../../../../core/utils/extensions.dart';
import '../../domain/entity/software.dart';

class SoftwareModel extends Software {
  const SoftwareModel({
    required super.title,
    required super.image,
    required super.color,
  });

  factory SoftwareModel.fromJson(Map<String, dynamic> json) => SoftwareModel(
        title: json['title'],
        image: json['image'],
        color: json.toColor('color'),
      );
}
