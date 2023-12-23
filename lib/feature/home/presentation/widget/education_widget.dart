import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extensions.dart';
import 'package:portfolio/feature/language/presentation/widgets/language_widget.dart';
import 'package:portfolio/feature/language/utils/local_language.dart';
import 'package:portfolio/feature/provider/presentation/widgets/app_provider.dart';

import '../../../../core/utils/assets.dart';
import '../../domain/entity/education.dart';

class EducationWidget extends StatelessWidget {
  final Education education;
  final double lineWidth;
  final int index;
  final bool isLast;
  final double textSize;
  const EducationWidget({
    Key? key,
    required this.education,
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
              '$index. ${education.mainField} - ${education.academicOrientation} - ${education.school}.'.toEnglishNumberOrPersianNumber(context),
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
                '''${Strings.of(context).from_label} ${language.isFa ? education.fromDateJalali?.year ?? '-' : education.fromDate.year} '''
                        '''${Strings.of(context).until_label} ${language.isFa ? education.toDateJalali?.year ?? '-' : education.toDate.year}.'''
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
