import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RightToLeftTransitionPage extends CustomTransitionPage<void> {
  RightToLeftTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (c, animation, a2, child) => SlideTransition(
            key: key,
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
