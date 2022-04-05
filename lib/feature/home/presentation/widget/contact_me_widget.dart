import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../language/utils/local_language.dart';
import '../../domain/entity/info.dart';
import 'title_widget.dart';

class ContactMeWidget extends StatelessWidget {
  final Info? info;
  const ContactMeWidget({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return info == null
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TitleWidget(
                textSize: 20,
                title: Strings.of(context).phone_label,
                fontWeight: Fonts.light300,
              ),
              TitleWidget(
                textSize: 18,
                title: info?.phoneNumber,
                fontWeight: Fonts.light300,
              ),
              const SizedBox(height: 24),
              TitleWidget(
                textSize: 20,
                title: Strings.of(context).email_label,
                fontWeight: Fonts.light300,
              ),
              TitleWidget(
                textSize: 18,
                title: info?.email,
                fontWeight: Fonts.light300,
              ),
            ],
          );
  }
}
