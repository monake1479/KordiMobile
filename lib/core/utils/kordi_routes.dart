import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/change_password/pages/change_password_page.dart';
import 'package:kordi_mobile/collections/controllers/get_collections/get_collections_cubit.dart';
import 'package:kordi_mobile/collections/pages/collection_details_page.dart';
import 'package:kordi_mobile/collections/pages/collection_page.dart';
import 'package:kordi_mobile/core/pages/about_page.dart';
import 'package:kordi_mobile/core/pages/error_page.dart';
import 'package:kordi_mobile/core/pages/kordi_scaffold.dart';
import 'package:kordi_mobile/core/transitions/fade_transition_page.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/l10n.dart';
import 'package:kordi_mobile/sign_in/pages/sign_in_page.dart';
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
class AboutPageRoute extends GoRouteData {
  const AboutPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: AboutPage(),
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

@TypedGoRoute<ChangePasswordPageRoute>(
  path: '/change-password',
  name: 'ChangePasswordPageRoute',
)
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
        child: KordiScaffold(
          child: ChangePasswordPage(),
        ),
      );
}

@TypedGoRoute<CollectionDetailsPageRoute>(
  path: '/collection-details/:collectionId',
  name: 'CollectionDetailsPageRoute',
)
@immutable
class CollectionDetailsPageRoute extends GoRouteData {
  CollectionDetailsPageRoute(this.collectionId);
  final int collectionId;

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    final collectionById =
        getIt.get<GetCollectionsCubit>().getById(collectionId);
    if (collectionById == null) {
      return ErrorPageRoute(S.current.collectionNotFoundError('$collectionId'))
          .location;
    }
    return super.redirect(context, state);
  }

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: CollectionDetailsPage(
          collectionId: collectionId,
        ),
      );
}

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
