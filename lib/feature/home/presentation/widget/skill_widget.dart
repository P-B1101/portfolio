import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extensions.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/enum.dart';
import '../../../language/utils/local_language.dart';
import '../../../provider/presentation/widgets/app_provider.dart';
import '../../domain/entity/skill.dart';

class SkillWidget extends StatelessWidget {
  final Skill skill;
  final int index;
  final double textSize;
  const SkillWidget({
    Key? key,
    required this.skill,
    required this.textSize,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadedSlideAnimation(
      fadeCurve: AppProvider.of(context).curve,
      fadeDuration: AppProvider.of(context).duration,
      slideCurve: AppProvider.of(context).curve,
      slideDuration: AppProvider.of(context).duration,
      beginOffset: const Offset(0, -.5),
      endOffset: const Offset(0, 0),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$index. ${skill.title} '
                    .toEnglishNumberOrPersianNumber(context),
                style: TextStyle(
                  fontSize: textSize,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              TextSpan(
                text: _getRateString(context),
                style: TextStyle(
                  fontSize: textSize - 1,
                  color: _getColor,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontWeight: Fonts.light300,
          ),
        ),
      ),
    );
  }

  Color get _getColor {
    switch (skill.rate) {
      case SkillRate.starter:
        return MyColors.primaryColor;
      case SkillRate.good:
        return MyColors.blueColor;
      case SkillRate.advance:
        return MyColors.greenColor;
    }
  }

  String _getRateString(BuildContext context) {
    switch (skill.rate) {
      case SkillRate.starter:
        return Strings.of(context).starter;
      case SkillRate.good:
        return Strings.of(context).good;
      case SkillRate.advance:
        return Strings.of(context).advance;
    }
  }
}
