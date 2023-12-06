import 'package:flutter/material.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';

class CollectionItemsCategories extends StatelessWidget {
  const CollectionItemsCategories({super.key, required this.items});
  final List<CollectionItem> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Wrap(
      children: items
          .map(
            (item) => Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colorScheme.primary,
              ),
              child: Text(
                item.category.name.toUpperCase(),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
