import 'package:flutter/material.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/widgets/kordi_exception_dialog.dart';
import 'package:kordi_mobile/core/widgets/kordi_information_dialog.dart';

class KordiDialog {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String buttonLabel,
    required void Function() onButtonOnPressed,
  }) async =>
      showAdaptiveDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: true,
        builder: (context) => KordiInformationDialog(
          title: title,
          subtitle: subtitle,
          buttonLabel: buttonLabel,
          onButtonOnPressed: onButtonOnPressed,
        ),
      );

  static Future<void> showException(
    BuildContext context,
    KordiException exception, {
    void Function()? overrideOnPressed,
  }) async =>
      showAdaptiveDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: true,
        builder: (context) => KordiExceptionDialog(
          exception: exception,
          overrideOnPressed: overrideOnPressed,
        ),
      );
}
