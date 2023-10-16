import '../../domain/entity/profession.dart';

class ProfessionModel extends Profession {
  const ProfessionModel({
    required String profession,
    required String slogan,
  }) : super(
          profession: profession,
          slogan: slogan,
        );

  factory ProfessionModel.fromJson(Map<String, dynamic> json) =>
      ProfessionModel(
        profession: json['profession'],
        slogan: json['slogan'],
      );
}
