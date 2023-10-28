import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/collections/pages/collection_page.dart';
import 'package:kordi_mobile/core/pages/about_page.dart';
import 'package:kordi_mobile/core/pages/kordi_scaffold.dart';
import 'package:kordi_mobile/core/transitions/fade_transition_page.dart';
import 'package:kordi_mobile/sign_in/controllers/pages/sign_in_page.dart';
import 'package:kordi_mobile/sign_up/models/verification_type.dart';
import 'package:kordi_mobile/sign_up/pages/sign_up_page.dart';
import 'package:kordi_mobile/verification_code/pages/verification_code_page.dart';

part 'kordi_routes.g.dart';

@TypedShellRoute<KordiScaffoldShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SignInPageRoute>(path: '/sign-in'),
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

@TypedGoRoute<VerificationCodePageRoute>(
  path: '/verification-code',
  name: 'VerificationCodePageRoute',
)
@immutable
class VerificationCodePageRoute extends GoRouteData {
  VerificationCodePageRoute(this.verificationType);
  final VerificationType verificationType;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return VerificationCodePage(verificationType: verificationType);
  }

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: VerificationCodePage(
          verificationType: verificationType,
        ),
      );
}
