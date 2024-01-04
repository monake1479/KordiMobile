import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (c, animation, a2, child) => FadeTransition(
            key: key,
            opacity: animation.drive(_curveTween),
            child: child,
          ),
        );

  static final _curveTween = CurveTween(curve: Curves.easeIn);
}
