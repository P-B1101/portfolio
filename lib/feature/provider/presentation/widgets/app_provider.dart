import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_provider_inherited.dart';

class AppProvider extends StatefulWidget {
  final Widget child;

  const AppProvider({
    Key? key,
    required this.child,
  }) : super(key: key);
  static AppProviderState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppProviderInherited>()!
        .data;
  }

  @override
  AppProviderState createState() => AppProviderState();
}

class AppProviderState extends State<AppProvider> {
  @override
  Widget build(BuildContext context) {
    return AppProviderInherited(
      child: widget.child,
      data: this,
    );
  }

  bool get isExtraSmall => MediaQuery.of(context).size.width < 300;

  bool get isSmall => MediaQuery.of(context).size.width < 350;
  bool get isTablet => MediaQuery.of(context).size.width > 600;
  bool get isWindow => MediaQuery.of(context).size.width > 1024;
  bool get isDark => Theme.of(context).brightness == Brightness.dark;

  bool get isWebMobile =>
      kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  Duration get duration => const Duration(milliseconds: 300);
  Curve get curve => Curves.ease;
}
