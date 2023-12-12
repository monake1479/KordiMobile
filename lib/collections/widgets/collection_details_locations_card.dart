import 'package:flutter/material.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/collections/widgets/localization_tile.dart';
import 'package:kordi_mobile/l10n/l10n.dart';

class CollectionDetailsLocationsTile extends StatelessWidget {
  const CollectionDetailsLocationsTile({super.key, required this.addresses});
  final List<CollectionAddresses> addresses;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.l10n.collectionDetailsLocationsLabel,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: LocalizationTile(
                  addresses: addresses,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
