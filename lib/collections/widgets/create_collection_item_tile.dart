import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
import 'package:kordi_mobile/collections/controllers/create_collection_form/create_collection_form_bloc.dart';

class CreateCollectionItemTile extends StatelessWidget {
  const CreateCollectionItemTile({super.key, required this.item});
  final CollectionItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Row(
      children: [
        Expanded(
          child: Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Text(
                      item.name,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      item.category.name,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      item.type.name,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      item.maxAmountWithUnit,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            context
                .read<CreateCollectionFormBloc>()
                .add(CreateCollectionFormEvent.removeItem(item));
          },
          icon: Icon(
            Icons.delete,
            color: colorScheme.error,
          ),
        ),
      ],
    );
  }
}
