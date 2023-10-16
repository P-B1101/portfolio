import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

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
  final bool isSmallScreen;
  const ProjectWidget({
    Key? key,
    required this.project,
    required this.textSize,
    required this.index,
    required this.isLast,
    required this.lineWidth,
    this.isSmallScreen = false,
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
            _titleWidget,
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

  Widget get _titleWidget => Builder(
        builder: (context) => isSmallScreen
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '$index. ${project.title} - ${project.subtitle}.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: textSize,
                      fontWeight: Fonts.light300,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  Row(
                    children: [
                      _androidLink,
                      _iOSLink,
                      _webLink,
                    ],
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Text(
                      '$index. ${project.title} - ${project.subtitle}.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: textSize,
                        fontWeight: Fonts.light300,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                  ),
                  _androidLink,
                  _iOSLink,
                  _webLink,
                ],
              ),
      );

  Widget get _androidLink => Builder(
        builder: (context) => _LinkWidget(
          link: project.androidLink,
          hasLink: project.hasAndroidLink,
          title: Strings.of(context).android_link_label,
        ),
      );

  Widget get _iOSLink => Builder(
        builder: (context) => _LinkWidget(
          link: project.iosLink,
          hasLink: project.hasiOSLink,
          title: Strings.of(context).ios_link_label,
        ),
      );

  Widget get _webLink => Builder(
        builder: (context) => _LinkWidget(
          link: project.webAppLink,
          hasLink: project.hasWebLink,
          title: Strings.of(context).web_link_label,
        ),
      );
}

class _LinkWidget extends StatelessWidget {
  final String link;
  final String title;
  final bool hasLink;
  const _LinkWidget({
    Key? key,
    required this.link,
    required this.hasLink,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasLink
        ? Link(
            uri: Uri.parse(link),
            target: LinkTarget.blank,
            builder: (context, link) => TextButton(
              onPressed: link,
              child: Text(title),
            ),
          )
        : const SizedBox();
  }
}
