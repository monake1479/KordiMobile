part of 'package:kordi_mobile/collections/pages/collection_details_page.dart';

class _CollectionDetailsItemList extends StatelessWidget {
  const _CollectionDetailsItemList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final collectionIdString =
        GoRouterState.of(context).pathParameters['collectionId'];
    final collectionId = int.parse(collectionIdString!);
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.list_rounded,
                      color: colorScheme.primary,
                    ),
                  ),
                  Text(
                    S.current.collectionDetailsItemListTitle,
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  if (!authState.isAuthorized) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        S.current.collectionDetailsItemListUnauthorizedState,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          decoration: TextDecoration.underline,
                          color: colorScheme.tertiary,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              BlocProvider<ManageCollectionItemsCubit>(
                create: (context) => getIt.get<ManageCollectionItemsCubit>()
                  ..setItems(collectionId),
                child: BlocBuilder<ManageCollectionItemsCubit,
                    ManageCollectionItemsState>(
                  builder: (context, state) {
                    if (state.items.isEmpty) {
                      return Text(
                        S.current.collectionDetailsItemListEmptyState,
                      );
                    }
                    return Column(
                      children: state.items
                          .map(
                            (item) => Card(
                              color: colorScheme.onPrimary,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        item.name,
                                        style: textTheme.titleMedium,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 8,
                                              ),
                                              child: Text(
                                                item.category.name,
                                                style: textTheme.bodyMedium,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 8,
                                              ),
                                              child: Text(
                                                S.current
                                                    .collectionDetailsItemTypeLabel(
                                                  item.type.name,
                                                ),
                                                style: textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Icon(
                                              item.category.icon,
                                              color: colorScheme.primary,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        S.current
                                            .collectionDetailsItemCurrentLabel(
                                          item.currentAmountWithUnit,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        S.current
                                            .collectionDetailsItemMaximumLabel(
                                          item.maxAmountWithUnit,
                                        ),
                                      ),
                                    ),
                                    _DonationSlider(
                                      item: item,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
