import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/core/pages/kordi_scaffold.dart';

class KordiRouter {
  static GoRouter router(BuildContext context) {
    return GoRouter(
      initialLocation: '/collection',
      debugLogDiagnostics: true,
      routes: $appRoutes,
    );
  }
}
