import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/core/transitions/fade_transition_page.dart';
import 'package:kordi_mobile/l10n/l10n.dart';

@immutable
class AboutPageRoute extends GoRouteData {
  const AboutPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: AboutPage(),
      );
}

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
