import 'package:flutter/material.dart';

class CollectionItemsCategories extends StatelessWidget {
  const CollectionItemsCategories({super.key, required this.categoriesNames});
  final List<String> categoriesNames;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Wrap(
      children: categoriesNames
          .map(
            (categoryName) => Container(
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
                categoryName.toUpperCase(),
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
