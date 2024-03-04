import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/create_collection_form/create_collection_form_bloc.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';

class CreateCollectionAddressTile extends StatelessWidget {
  const CreateCollectionAddressTile({super.key, required this.address});
  final CollectionAddress address;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 3,
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
                      address.city,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      address.street,
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
            context.read<CreateCollectionFormBloc>().add(
                  CreateCollectionFormEvent.removeAddress(address),
                );
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
