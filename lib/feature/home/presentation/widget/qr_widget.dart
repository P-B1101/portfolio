import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/utils/assets.dart';

class QRWidget extends StatelessWidget {
  final String url;
  final String title;
  const QRWidget({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomPaint(
            size: const Size.square(150),
            painter: QrPainter(
              data: url,
              version: QrVersions.auto,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: Fonts.light300,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ],
    );
  }
}
