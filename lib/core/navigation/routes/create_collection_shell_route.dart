part of 'package:kordi_mobile/core/navigation/kordi_router.dart';

@TypedShellRoute<CreateCollectionShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<CreateCollectionFirstStepRoute>(path: '/basic'),
    TypedGoRoute<CreateCollectionSecondStepRoute>(path: '/addresses'),
    TypedGoRoute<CreateCollectionThirdStepRoute>(path: '/items'),
    TypedGoRoute<CreateCollectionFourthStepRoute>(path: '/finish'),
  ],
)
class CreateCollectionShellRoute extends ShellRouteData {
  const CreateCollectionShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) =>
      CreateCollectionPage(child: navigator);
}

@immutable
class CreateCollectionFirstStepRoute extends GoRouteData {
  const CreateCollectionFirstStepRoute();

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: CreateCollectionFirstStep(),
      );
}

@immutable
class CreateCollectionSecondStepRoute extends GoRouteData {
  const CreateCollectionSecondStepRoute();

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: CreateCollectionSecondStep(),
      );
}

@immutable
class CreateCollectionThirdStepRoute extends GoRouteData {
  const CreateCollectionThirdStepRoute();

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: CreateCollectionThirdStep(),
      );
}

@immutable
class CreateCollectionFourthStepRoute extends GoRouteData {
  const CreateCollectionFourthStepRoute();

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: CreateCollectionFourthStep(),
      );
}
