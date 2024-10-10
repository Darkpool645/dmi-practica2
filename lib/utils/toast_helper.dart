import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastHelper {
  static void showSuccess(BuildContext context, String message) {
    toastification.show(
      context: context,
      title: const Text('Éxito'),
      description: Text(message),
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

  static void showInfo(BuildContext context, String message, String info) {
    toastification.show(
      context: context,
      title: Text(info),
      description: Text(message),
      type: ToastificationType.info,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }
}
