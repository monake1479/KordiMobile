import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/core/transitions/fade_transition_page.dart';
import 'package:kordi_mobile/l10n/l10n.dart';

@immutable
class CollectionPageRoute extends GoRouteData {
  CollectionPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: CollectionPage(),
      );
}

class CollectionPage extends StatelessWidget {
  const CollectionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.l10n.collectionPageTitle,
      ),
    );
  }
}
