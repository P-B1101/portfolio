import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/utils/assets.dart';

import '../../../provider/presentation/widgets/app_provider.dart';
import '../../domain/entity/software.dart';

class SoftwareWidget extends StatelessWidget {
  final List<Software> items;
  const SoftwareWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 24,
            spacing: 24,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            children: List.generate(
              items.length,
              (index) => _ItemWidget(
                software: items[index],
              ),
            ),
          ),
          if (items.isNotEmpty)
            Container(
              width: 120,
              height: 1,
              margin: const EdgeInsets.only(top: 6),
              color: Theme.of(context).primaryColor,
            ),
        ],
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final Software software;
  const _ItemWidget({
    Key? key,
    required this.software,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _imageWidge,
          _titleWidget,
        ],
      ),
    );
  }

  Widget get _imageWidge => Builder(
        builder: (context) => Container(
          width: 100,
          height: 100,
          margin: const EdgeInsetsDirectional.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: software.color,
          ),
          child: Center(
            child: SizedBox(
              width: 46,
              child: AspectRatio(
                aspectRatio: 1,
                child: SvgPicture.asset(
                  software.image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      );

  Widget get _titleWidget => Builder(
        builder: (context) => SizedBox(
          width: 100,
          child: Text(
            software.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: Fonts.light300,
              color: Theme.of(context).textTheme.bodyText1?.color,
            ),
          ),
        ),
      );
}
