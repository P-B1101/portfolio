import 'package:equatable/equatable.dart';
import '../../../../core/utils/enum.dart';

class Skill extends Equatable {
  final String title;
  final SkillRate rate;
  const Skill({
    required this.rate,
    required this.title,
  });

  @override
  List<Object?> get props => [
        rate,
        title,
      ];
}
