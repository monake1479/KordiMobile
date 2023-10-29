import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:kordi_mobile/collections/widgets/localization_tile.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return RefreshIndicator(
      onRefresh: () async {
        log('[CollectionPage] refresh collections');
      },
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) => Card(
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
                    'https://picsum.photos/seed/$index/200/300',
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width * 0.32,
                    height: MediaQuery.of(context).size.height * 0.32,
                  ),
                ),
                Text(
                  'Title item of $index',
                  style: theme.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Subtitle item of $index',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                ),
                LocalizationTile(),
                Card(
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
                          'Collection progress:',
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
                          '159 days left until the end',
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
