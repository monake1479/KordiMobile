part of 'package:kordi_mobile/collections/pages/collection_edit_page.dart';

class _CollectionEditItemList extends StatelessWidget {
  const _CollectionEditItemList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return BlocConsumer<ManageCollectionItemsCubit, ManageCollectionItemsState>(
      listener: (context, state) async {
        if (state.exception != null) {
          await KordiDialog.showException(
            context,
            state.exception!,
          );
        }
      },
      builder: (context, state) {
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
                        S.current.collectionEditItemListTitle,
                        style: theme.textTheme.bodyLarge,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      if (state.items.isEmpty) {
                        return Text(
                          S.current.collectionEditItemListEmptyState,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 8,
                                              ),
                                              child: Text(
                                                item.name,
                                                style: textTheme.titleMedium,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              await _onAddOrEditItemButtonOnPressed(
                                                context,
                                                item: item,
                                              );
                                            },
                                            icon: Icon(Icons.edit),
                                          ),
                                        ],
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
                                                      .collectionEditItemTypeLabel(
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
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Text(
                                          S.current
                                              .collectionEditItemCurrentLabel(
                                            item.currentAmountWithUnit,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Text(
                                          S.current
                                              .collectionEditItemMaximumLabel(
                                            item.maxAmountWithUnit,
                                          ),
                                        ),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          colorScheme.onPrimary,
                        ),
                      ),
                      onPressed: () async {
                        await _onAddOrEditItemButtonOnPressed(
                          context,
                        );
                      },
                      child: Text(
                        S.current.collectionEditItemListAddButtonLabel,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onAddOrEditItemButtonOnPressed(
    BuildContext context, {
    CollectionItem? item,
  }) async {
    final result = await CollectionItemDialog.show(
      context,
      item: item,
    );

    if (result != null) {
      if (item != null) {
        context.read<ManageCollectionItemsCubit>().editItem(
              result,
            );

        return;
      }
      context.read<ManageCollectionItemsCubit>().addItem(
            result,
          );
    }
  }
}
