part of 'package:kordi_mobile/core/navigation/kordi_router.dart';

@TypedGoRoute<VerificationCodePageRoute>(
  path: '/verification-code',
  name: 'VerificationCodePageRoute',
)
@immutable
class VerificationCodePageRoute extends GoRouteData {
  const VerificationCodePageRoute(this.verificationType);
  final VerificationType verificationType;

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
