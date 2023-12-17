import 'package:flutter/material.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';

class KordiInformationDialog extends StatelessWidget {
  const KordiInformationDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    required this.onButtonOnPressed,
  });

  final String title;
  final String subtitle;
  final String buttonLabel;
  final void Function() onButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.exception.svg(
            width: MediaQuery.of(context).size.width * 0.35,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(subtitle),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            onButtonOnPressed();
          },
          child: Text(buttonLabel),
        ),
      ],
    );
  }
}
