part of 'package:kordi_mobile/core/navigation/kordi_router.dart';

@TypedGoRoute<ErrorPageRoute>(
  path: '/error',
  name: 'ErrorPageRoute',
)
@immutable
class ErrorPageRoute extends GoRouteData {
  ErrorPageRoute(this.exceptionDescription);
  final String exceptionDescription;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: ErrorPage(
          exceptionDescription: exceptionDescription,
        ),
      );
}
