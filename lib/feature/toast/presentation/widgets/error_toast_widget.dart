import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class ErrorToastWidget extends StatelessWidget {
  final String message;
  const ErrorToastWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 2,
        bottom: 2,
      ),
      constraints: const BoxConstraints(minHeight: 48),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: MyColors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: Fonts.regular400,
                color: MyColors.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
