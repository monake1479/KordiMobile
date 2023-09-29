import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/home_page.dart';

part 'kordi_router.g.dart';

class KordiRouter {
  static GoRouter router(BuildContext context) {
    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: $appRoutes,
    );
  }
}
