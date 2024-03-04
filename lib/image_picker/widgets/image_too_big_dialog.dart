import 'package:flutter/material.dart';
import 'package:kordi_mobile/gen/l10n.dart';

class FileTooBigDialog extends StatelessWidget {
  const FileTooBigDialog();

  static Future<void> show(BuildContext context) async => showAdaptiveDialog(
        context: context,
        builder: (context) => FileTooBigDialog(),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return AlertDialog.adaptive(
      title: Text(S.current.imageTooBigDialogTitle),
      titleTextStyle: textTheme.headlineSmall,
      titlePadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10) +
          const EdgeInsets.only(bottom: 24, top: 12),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: const Icon(Icons.picture_as_pdf_rounded),
              ),
              Flexible(
                child: Text(
                  S.current.imageTooBigDialogSubtitle,
                  style: textTheme.labelLarge,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(S.current.imageTooBigDialogButtonLabel),
          ),
        ],
      ),
    );
  }
}
