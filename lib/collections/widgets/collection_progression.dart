import 'package:flutter/material.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/gen/l10n.dart';

class CollectionProgression extends StatelessWidget {
  const CollectionProgression({
    super.key,
    required this.collection,
  });
  final Collection collection;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    if (collection.endTime == null) {
      return const SizedBox();
    }

    return Card(
      color: theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.current.collectionPageProgress,
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(8),
                        value: collection.timeProgress,
                      ),
                    ),
                  ),
                  Text(
                    '${collection.timeProgressInPercents.ceil()} %',
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ],
              ),
            ),
            Text(
              S.current.collectionPageDaysLeft(
                collection.daysToComplete,
              ),
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
