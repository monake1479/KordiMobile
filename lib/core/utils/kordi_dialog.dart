import 'package:flutter/material.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/widgets/kordi_exception_dialog.dart';

class KordiDialog {
  static Future<void> showException(
    BuildContext context,
    KordiException exception, {
    void Function()? overrideOnPressed,
  }) async =>
      showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: true,
        builder: (context) => KordiExceptionDialog(
          exception: exception,
          overrideOnPressed: overrideOnPressed,
        ),
      );
}
