import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/home_page.dart';

class KordiRouter {
  static GoRouter router(BuildContext context) {
    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: [
        GoRoute(path: '/', builder: (context, state) => HomePage()),
      ]
      // errorPageBuilder: (context, state) {
      //   log(state.error.toString());
      //   return MaterialPage<void>(
      //     key: state.pageKey,
      //     child: const ErrorPage(),
      //   );
      // },
      ,
    );
  }
}

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (c, animation, a2, child) => FadeTransition(
            opacity: animation.drive(_curveTween),
            child: child,
          ),
        );

  static final _curveTween = CurveTween(curve: Curves.easeIn);
}
