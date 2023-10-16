import '../../../../core/utils/enum.dart';
import '../../domain/entity/skill.dart';

class SkillModel extends Skill {
  const SkillModel({
    required String title,
    required SkillRate rate,
  }) : super(
          rate: rate,
          title: title,
        );

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        title: json['title'],
        rate: SkillRate.values[json['rate'] - 1],
      );
}
