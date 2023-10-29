import 'package:flutter/material.dart';
import 'package:kordi_mobile/l10n/l10n.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      color: colorScheme.tertiaryContainer,
      child: Center(
        child: Text(
          context.l10n.aboutPageTitle,
        ),
      ),
    );
  }
}
