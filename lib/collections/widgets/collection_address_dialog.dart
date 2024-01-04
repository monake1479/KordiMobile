import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/collection_address_form/collection_address_form_bloc.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/widgets/kordi_text_field.dart';
import 'package:kordi_mobile/dependency_injection.dart';

class CollectionAddressDialog extends StatefulWidget {
  const CollectionAddressDialog({
    super.key,
    required this.isEdit,
    required this.address,
  });

  final bool isEdit;
  final CollectionAddress? address;

  static Future<CollectionAddress?> show(
    BuildContext context, {
    bool isEdit = false,
    CollectionAddress? address,
  }) async {
    return showDialog<CollectionAddress?>(
      context: context,
      builder: (context) => CollectionAddressDialog(
        isEdit: isEdit,
        address: address,
      ),
    );
  }

  @override
  State<CollectionAddressDialog> createState() =>
      _CollectionAddressDialogState();
}

class _CollectionAddressDialogState extends State<CollectionAddressDialog> {
  late TextEditingController _cityController;
  late TextEditingController _streetController;
  @override
  void initState() {
    _cityController = TextEditingController();
    _streetController = TextEditingController();
    if (widget.isEdit) {
      _cityController.text = widget.address?.city ?? '';
      _streetController.text = widget.address?.street ?? '';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return BlocProvider(
      create: (context) {
        if (widget.isEdit && widget.address != null) {
          return getIt.get<CollectionAddressFormBloc>()
            ..add(
              CollectionAddressFormEvent.setInitial(widget.address!),
            );
        } else {
          return getIt.get<CollectionAddressFormBloc>();
        }
      },
      child: BlocBuilder<CollectionAddressFormBloc, CollectionAddressFormState>(
        builder: (context, state) {
          final collectionAddressFormBloc =
              context.read<CollectionAddressFormBloc>();

          return AlertDialog(
            title: Text(widget.isEdit ? 'Add address' : 'Edit address'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: KordiTextField(
                    controller: _cityController,
                    labelText: 'City',
                    errorText: state.validationError && state.city.isEmpty
                        ? 'Field required'
                        : null,
                    onChanged: (city) => collectionAddressFormBloc
                        .add(CollectionAddressFormEvent.setCity(city)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: KordiTextField(
                    controller: _streetController,
                    labelText: 'Street',
                    errorText: state.validationError && state.street.isEmpty
                        ? 'Field required'
                        : null,
                    onChanged: (street) => collectionAddressFormBloc
                        .add(CollectionAddressFormEvent.setStreet(street)),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (state.validationError) {
                      return Text(
                        'Please fill all fields',
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.error,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  collectionAddressFormBloc
                      .add(CollectionAddressFormEvent.checkValidation());
                  if (state.isFormValid) {
                    Navigator.of(context).pop(state.toCollectionAddress);
                  }
                },
                child: Text('Add'),
              ),
            ],
          );
        },
      ),
    );
  }
}
