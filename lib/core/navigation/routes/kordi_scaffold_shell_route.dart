part of 'package:kordi_mobile/core/navigation/kordi_router.dart';

@TypedShellRoute<KordiScaffoldShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SignInPageRoute>(path: '/sign-in'),
    TypedGoRoute<SignUpPageRoute>(path: '/sign-up'),
    TypedGoRoute<CollectionPageRoute>(path: '/collection'),
    TypedGoRoute<ChangePasswordPageRoute>(path: '/change-password'),
    TypedGoRoute<AboutPageRoute>(path: '/about'),
  ],
)
class KordiScaffoldShellRoute extends ShellRouteData {
  const KordiScaffoldShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) =>
      KordiScaffold(child: navigator);
}

@immutable
class SignInPageRoute extends GoRouteData {
  const SignInPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: SignInPage(),
      );
}

@immutable
class SignUpPageRoute extends GoRouteData {
  const SignUpPageRoute();

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: SignUpPage(),
      );
}

@immutable
class CollectionPageRoute extends GoRouteData {
  const CollectionPageRoute();

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: CollectionPage(),
      );
}

@immutable
class ChangePasswordPageRoute extends GoRouteData {
  ChangePasswordPageRoute();

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: ChangePasswordPage(),
      );
}

@immutable
class AboutPageRoute extends GoRouteData {
  const AboutPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: AboutPage(),
      );
}
