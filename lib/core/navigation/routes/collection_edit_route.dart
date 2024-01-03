part of 'package:kordi_mobile/core/navigation/kordi_router.dart';

@TypedGoRoute<CollectionEditPageRoute>(
  path: '/collection-details/:collectionId/edit',
  name: 'CollectionEditPageRoute',
)
@immutable
class CollectionEditPageRoute extends GoRouteData {
  CollectionEditPageRoute(this.collectionId);
  final int collectionId;

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    final collectionById =
        getIt.get<CollectionsFilterBloc>().getById(collectionId);
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
      RightToLeftTransitionPage(
        key: state.pageKey,
        child: CollectionEditPage(
          collectionId: collectionId,
        ),
      );
}
