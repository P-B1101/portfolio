import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../provider/presentation/widgets/app_provider.dart';
import '../../utils/local_language.dart';
import 'language_widget.dart';

class LanguageLabelWidget extends StatelessWidget {
  final Function(String language) onChangeLanguageClick;
  const LanguageLabelWidget({
    super.key,
    required this.onChangeLanguageClick,
  });

  @override
  Widget build(BuildContext context) {
    return LanguageWidget(
      builder: (language) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ItemWidget(
            label: Strings.of(context).farsi_label,
            language: 'fa',
            onChangeLanguageClick: onChangeLanguageClick,
            isFarsi: language.isFa,
            isSelected: language.isFa,
          ),
          Container(
            width: 1,
            height: 20,
            color: MyColors.subtitleColor,
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
          _ItemWidget(
            label: Strings.of(context).english_label,
            language: 'en',
            onChangeLanguageClick: onChangeLanguageClick,
            isFarsi: language.isFa,
            isSelected: !language.isFa,
          ),
        ],
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final String language;
  final String label;
  final Function(String language) onChangeLanguageClick;
  final bool isSelected;
  final bool isFarsi;
  const _ItemWidget({
    required this.label,
    required this.language,
    required this.onChangeLanguageClick,
    required this.isSelected,
    required this.isFarsi,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: isSelected ? MouseCursor.defer : SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: isSelected ? null : () => onChangeLanguageClick(language),
        child: AnimatedDefaultTextStyle(
          duration: AppProvider.of(context).duration,
          curve: AppProvider.of(context).curve,
          style: TextStyle(
            fontFamily: isFarsi ? Fonts.yekan : Fonts.poppins,
            color: isSelected ? MyColors.textColor : MyColors.subtitleColor,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
