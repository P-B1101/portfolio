import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../../provider/presentation/widgets/app_provider.dart';
import 'phone/home_page_phone.dart';
import 'tablet/home_page_tablet.dart';
import 'window/home_page_window.dart';

class HomePageMain extends StatelessWidget {
  final Function() onExportClick;
  final ScreenshotController screenshotController;
  const HomePageMain({
    Key? key,
    required this.onExportClick,
    required this.screenshotController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: AppProvider.of(context).duration,
      curve: AppProvider.of(context).curve,
      child: AnimatedSwitcher(
        duration: AppProvider.of(context).duration,
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: AppProvider.of(context).isWindow
            ? HomePageWindow(
                onExportClick: onExportClick,
                screenshotController: screenshotController,
              )
            : AppProvider.of(context).isTablet
                ? const HomePageTablet()
                : const HomePagePhone(),
      ),
    );
  }
}
