import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extensions.dart';
import 'package:portfolio/feature/language/presentation/widgets/language_widget.dart';

import '../../../../core/utils/assets.dart';
import '../../../language/utils/local_language.dart';
import '../../../provider/presentation/widgets/app_provider.dart';
import '../../domain/entity/job_experience.dart';

class JobExperienceWidget extends StatelessWidget {
  final JobExperience experience;
  final double lineWidth;
  final int index;
  final bool isLast;
  final double textSize;
  const JobExperienceWidget({
    Key? key,
    required this.experience,
    required this.textSize,
    required this.index,
    required this.isLast,
    required this.lineWidth,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$index. ${experience.company}${Strings.of(context).virgul} ${experience.title}.'
                  .toEnglishNumberOrPersianNumber(context),
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: textSize,
                fontWeight: Fonts.light300,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 4),
            LanguageWidget(
              builder: (language) => Text(
                '''${Strings.of(context).from_label} ${language.isFa ? experience.fromDateJalali?.year ?? '-' : experience.fromDate.year} '''
                        '''${Strings.of(context).until_label} '''
                        '''${experience.isContinue ? Strings.of(context).now_label : language.isFa ? experience.toDateJalali?.year ?? '-' : experience.toDate.year}.'''
                    .toEnglishNumberOrPersianNumber(context),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: textSize - 2,
                  fontWeight: Fonts.light300,
                  color: Theme.of(context).textTheme.titleMedium?.color,
                ),
              ),
            ),
            Container(
              width: isLast ? lineWidth : 0,
              height: isLast ? 1 : 0,
              margin: EdgeInsets.only(top: isLast ? 4 : 0),
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
