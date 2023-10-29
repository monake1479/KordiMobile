import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/core/pages/kordi_scaffold.dart';
import 'package:kordi_mobile/core/utils/kordi_routes.dart';

class KordiRouter {
  static GoRouter router(BuildContext context) {
    return GoRouter(
      initialLocation: '/collection',
      debugLogDiagnostics: true,
      routes: $appRoutes,
      errorBuilder: (context, state) => KordiScaffold(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Oops! How did you get here?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: () => CollectionPageRoute().go(context),
              child: Text('To collections'),
            ),
          ],
        ),
      ),
    );
  }
}
