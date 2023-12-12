import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/enum.dart';
import '../widgets/error_toast_widget.dart';
import '../widgets/info_toast_widget.dart';
import '../widgets/success_toast_widget.dart';

abstract class ToastManager {
  Future<void> showToast({
    required BuildContext context,
    required String message,
    int? number,
    ToastState state = ToastState.info,
  });
}

@LazySingleton(as: ToastManager)
class ToastManagerImpl implements ToastManager {
  final FToast fToast;

  const ToastManagerImpl({
    required this.fToast,
  });

  @override
  Future<void> showToast({
    required BuildContext context,
    required String message,
    int? number,
    ToastState state = ToastState.info,
  }) async {
    fToast.init(context);
    fToast.removeQueuedCustomToasts();
    final Widget child;
    switch (state) {
      case ToastState.info:
        child = InfoToastWidget(
          message: number == null ? message : '$message ($number)',
        );
        break;
      case ToastState.success:
        child = SuccessToastWidget(
          message: number == null ? message : '$message ($number)',
        );
        break;
      case ToastState.error:
        child = ErrorToastWidget(
          message: number == null ? message : '$message ($number)',
        );
        break;
    }
    fToast.showToast(
      child: child,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
