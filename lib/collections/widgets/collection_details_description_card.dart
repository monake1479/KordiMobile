part of 'package:kordi_mobile/collections/pages/collection_details_page.dart';

class _CollectionDetailsDescriptionCard extends StatelessWidget {
  const _CollectionDetailsDescriptionCard(this.description);
  final String description;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              Text(
                S.current.collectionDetailsDescriptionLabel,
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
