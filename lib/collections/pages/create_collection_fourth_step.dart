part of 'package:kordi_mobile/collections/pages/create_collection_page.dart';

class CreateCollectionFourthStep extends StatelessWidget {
  const CreateCollectionFourthStep({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Congratulations!',
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge,
                ),
                Text(
                  'Step 4 of 4',
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium!.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Text(
                    'You have successfully created a collection!',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge,
                  ),
                ),
                Text(
                  'You can still edit it later.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Assets.images.welcoming.svg(
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ) +
              EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            onPressed: () {
              CollectionPageRoute().go(context);
            },
            child: Text(
              'To collections',
              style: textTheme.bodyLarge!.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
