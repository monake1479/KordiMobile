import 'package:flutter/material.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/collections/widgets/collection_item_categories.dart';
import 'package:kordi_mobile/collections/widgets/collection_progression.dart';
import 'package:kordi_mobile/collections/widgets/localization_tile.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    super.key,
    required this.collection,
  });
  final Collection collection;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        CollectionDetailsPageRoute(collection.id).go(context);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Builder(
                builder: (context) {
                  if (collection.image == null) {
                    return Assets.images.camera.svg(
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width * 0.32,
                      height: MediaQuery.of(context).size.height * 0.32,
                    );
                  }
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.memory(
                      collection.image!,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width * 0.32,
                      height: MediaQuery.of(context).size.height * 0.32,
                    ),
                  );
                },
              ),
              Text(
                collection.title,
                style: theme.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  collection.shorterDescription,
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.justify,
                ),
              ),
              LocalizationTile(
                addresses: collection.addresses,
              ),
              CollectionItemsCategories(
                categoriesNames: collection.categoriesNames,
              ),
              CollectionProgression(
                collection: collection,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
