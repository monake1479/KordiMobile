part of 'package:kordi_mobile/core/navigation/kordi_router.dart';

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
  ) {
    final collectionById =
        getIt.get<CollectionsFilterBloc>().getById(collectionId);
    return FadeTransitionPage(
      key: state.pageKey,
      child: CollectionDetailsPage(
        collection: collectionById!,
      ),
    );
  }
}
