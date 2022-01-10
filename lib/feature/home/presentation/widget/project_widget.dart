import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../language/utils/local_language.dart';
import '../../../provider/presentation/widgets/app_provider.dart';
import '../../domain/entity/project.dart';

class ProjectWidget extends StatelessWidget {
  final Project project;
  final double lineWidth;
  final int index;
  final bool isLast;
  final double textSize;
  const ProjectWidget({
    Key? key,
    required this.project,
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
              '$index. ${project.title} - ${project.subtitle}.',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: textSize,
                fontWeight: Fonts.light300,
                color: Theme.of(context).textTheme.bodyText1?.color,
              ),
            ),
            Container(
              width: isLast ? lineWidth : 0,
              height: isLast ? 1 : 0,
              margin: EdgeInsets.only(top: isLast ? 6 : 0),
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
