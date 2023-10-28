import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/core/transitions/fade_transition_page.dart';

@immutable
class SignInPageRoute extends GoRouteData {
  SignInPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: SignInPage(),
      );
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Card(
      margin: const EdgeInsets.all(16),
      color: colorScheme.primaryContainer,
      child: Center(
        child: Text(
          'Sign in page',
        ),
      ),
    );
  }
}
