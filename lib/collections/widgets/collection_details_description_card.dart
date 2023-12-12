import 'package:flutter/material.dart';
import 'package:kordi_mobile/l10n/l10n.dart';

class CollectionDetailsDescriptionCard extends StatelessWidget {
  const CollectionDetailsDescriptionCard({
    super.key,
    required this.description,
  });
  final String description;

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
                context.l10n.collectionDetailsDescriptionLabel,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  description,
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
