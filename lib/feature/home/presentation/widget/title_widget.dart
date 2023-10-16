import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../provider/presentation/widgets/app_provider.dart';

class TitleWidget extends StatelessWidget {
  final String? title;
  final double textSize;
  final FontWeight? fontWeight;
  const TitleWidget({
    Key? key,
    required this.textSize,
    required this.title,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: AppProvider.of(context).duration,
      curve: AppProvider.of(context).curve,
      alignment: AlignmentDirectional.bottomCenter,
      child: Container(
        width: double.infinity,
        alignment: AlignmentDirectional.centerStart,
        child: AnimatedSwitcher(
          duration: AppProvider.of(context).duration,
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: title == null
              ? const SizedBox(width: double.infinity)
              : Text(
                  title!,
                  key: ValueKey(title == null ? 0 : 1),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: textSize,
                    fontWeight: fontWeight ?? Fonts.medium500,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
        ),
      ),
    );
  }
}
