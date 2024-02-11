part of 'package:kordi_mobile/collections/pages/collection_details_page.dart';

class _CollectionDetailsDateCard extends StatelessWidget {
  const _CollectionDetailsDateCard(this.formattedEndTime);
  final String formattedEndTime;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                      Icons.calendar_month_rounded,
                      color: colorScheme.primary,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      S.current.collectionDetailsEndTimeLabel,
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              Text(formattedEndTime),
            ],
          ),
        ),
      ),
    );
  }
}
