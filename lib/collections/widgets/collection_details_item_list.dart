part of 'package:kordi_mobile/collections/pages/collection_details_page.dart';

class _CollectionDetailsItemList extends StatelessWidget {
  const _CollectionDetailsItemList({
    super.key,
    required this.items,
  });
  final List<CollectionItem> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
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
              Builder(
                builder: (context) {
                  if (items.isEmpty) {
                    return Text(S.current.collectionDetailsItemListEmptyState);
                  }

                  return Column(
                    children: items
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
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      S.current
                                          .collectionDetailsItemDonateLabel,
                                    ),
                                  ),
                                  Slider(
                                    value: item.currentAmount.toDouble(),
                                    max: item.maxAmount.toDouble(),
                                    min: item.currentAmount.toDouble(),
                                    onChanged: (value) {
                                      log('value: $value');
                                    },
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
            ],
          ),
        ),
      ),
    );
  }
}
