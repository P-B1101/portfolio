import 'package:flutter/material.dart';
import 'app_provider.dart';

class AppProviderInherited extends InheritedWidget {
  final AppProviderState data;
  const AppProviderInherited({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant AppProviderInherited oldWidget) {
    return true;
  }
}
