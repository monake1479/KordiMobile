import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/collections/pages/collection_page.dart';
import 'package:kordi_mobile/core/pages/about_page.dart';
import 'package:kordi_mobile/core/widgets/kordi_drawer.dart';
import 'package:kordi_mobile/resources/resources.dart';
import 'package:kordi_mobile/sign_up/pages/sign_up_page.dart';

part 'kordi_scaffold.g.dart';

@TypedShellRoute<KordiScaffoldShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SignUpPageRoute>(path: '/sign-up'),
    TypedGoRoute<CollectionPageRoute>(path: '/collection'),
    TypedGoRoute<AboutPageRoute>(path: '/about'),
  ],
)
class KordiScaffoldShellRoute extends ShellRouteData {
  const KordiScaffoldShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) =>
      KordiScaffold(child: navigator);
}

class KordiScaffold extends StatelessWidget {
  const KordiScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 30,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: colorScheme.primary,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: GestureDetector(
                onTap: () => CollectionPageRoute().go(context),
                child: Image(
                  image: AssetImage(KordiIcons.logo),
                  width: 38,
                ),
              ),
            ),
            Text(
              'KORDI Mobile',
              style: TextStyle(color: colorScheme.secondary),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: colorScheme.primary,
            ),
            onPressed: () {
              log('Search button pressed');
            },
          ),
        ],
      ),
      drawer: KordiDrawer(),
      body: child,
    );
  }
}
