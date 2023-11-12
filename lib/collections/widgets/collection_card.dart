import 'package:flutter/material.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/collections/widgets/localization_tile.dart';
import 'package:kordi_mobile/l10n/l10n.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    super.key,
    required this.collection,
  });
  final Collection collection;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/seed/${collection.id}/200/300',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * 0.32,
                height: MediaQuery.of(context).size.height * 0.32,
              ),
            ),
            Text(
              collection.title,
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                collection.description,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ),
            ),
            LocalizationTile(
              addresses: collection.addresses,
            ),
            Builder(
              builder: (context) {
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
                          context.l10n.collectionPageProgress,
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
                                  child: LinearProgressIndicator(),
                                ),
                              ),
                              Icon(
                                Icons.check_circle_outline,
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          context.l10n.collectionPageDaysLeft(
                            collection.daysToComplete,
                          ),
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
