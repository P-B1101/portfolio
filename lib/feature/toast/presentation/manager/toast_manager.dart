import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/enum.dart';
import '../widgets/error_toast_widget.dart';
import '../widgets/info_toast_widget.dart';
import '../widgets/success_toast_widget.dart';

abstract class ToastManager {
  Future<void> showToast({
    required BuildContext context,
    required String message,
    ToastState state = ToastState.info,
  });
}

class ToastManagerImpl implements ToastManager {
  final FToast fToast;

  const ToastManagerImpl({
    required this.fToast,
  });

  @override
  Future<void> showToast({
    required BuildContext context,
    required String message,
    ToastState state = ToastState.info,
  }) async {
    fToast.init(context);
    fToast.removeQueuedCustomToasts();
    final Widget child;
    switch (state) {
      case ToastState.info:
        child = InfoToastWidget(message: message);
        break;
      case ToastState.success:
        child = SuccessToastWidget(message: message);
        break;
      case ToastState.error:
        child = ErrorToastWidget(
          message: message,
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
