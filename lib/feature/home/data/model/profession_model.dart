import '../../domain/entity/profession.dart';

class ProfessionModel extends Profession {
  const ProfessionModel({
    required super.profession,
    required super.slogan,
  });

  factory ProfessionModel.fromJson(Map<String, dynamic> json) =>
      ProfessionModel(
        profession: json['profession'],
        slogan: json['slogan'],
      );
}
