part of 'package:kordi_mobile/collections/pages/collection_details_page.dart';

class _CollectionDetailsComments extends StatelessWidget {
  const _CollectionDetailsComments({super.key});

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
                      Icons.comment,
                      color: colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Komentarze',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Builder(
                builder: (context) {
                  return Column(
                    children: [
                      Card(
                        color: colorScheme.onPrimary,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  'Komentarz 1',
                                  style: textTheme.bodyLarge,
                                ),
                              ),
                              Text(
                                'Komentarz 1',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: colorScheme.onPrimary,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  'Komentarz 2',
                                  style: textTheme.bodyLarge,
                                ),
                              ),
                              Text(
                                'Komentarz 2',
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
