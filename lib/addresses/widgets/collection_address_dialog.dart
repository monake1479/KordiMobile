import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/addresses/controllers/collection_address_form/collection_address_form_bloc.dart';
import 'package:kordi_mobile/addresses/controllers/manage_collection_address/manage_collection_address_cubit.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/l10n.dart';

class CollectionAddressDialog extends StatefulWidget {
  const CollectionAddressDialog({
    super.key,
    required this.address,
    required this.collectionId,
  });

  final CollectionAddress? address;
  final int? collectionId;

  static Future<CollectionAddress?> show(
    BuildContext context, {
    CollectionAddress? address,
    int? collectionId,
  }) async {
    return showAdaptiveDialog<CollectionAddress?>(
      context: context,
      builder: (context) => CollectionAddressDialog(
        address: address,
        collectionId: collectionId,
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<ManageCollectionAddressCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<CollectionAddressFormBloc>(),
        ),
      ],
      child: BlocListener<ManageCollectionAddressCubit,
          ManageCollectionAddressState>(
        listener: (context, manageCollectionAddressState) async {
          if (manageCollectionAddressState.exception != null) {
            await KordiDialog.showException(
              context,
              manageCollectionAddressState.exception!,
            );
          }
        },
        child:
            BlocBuilder<CollectionAddressFormBloc, CollectionAddressFormState>(
          builder: (context, state) {
            final collectionAddressFormBloc =
                context.read<CollectionAddressFormBloc>();
            final manageCollectionAddressCubit =
                getIt.get<ManageCollectionAddressCubit>();

            return AlertDialog.adaptive(
              title: Text(
                S.current.collectionAddressDialogAddTitle,
              ),
              content: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(),
                          labelText: S
                              .current.collectionAddressDialogCityFormLabelText,
                          errorText: state.validationError && state.city.isEmpty
                              ? S.current.fieldRequiredErrorLabel
                              : null,
                        ),
                        onChanged: (city) => collectionAddressFormBloc
                            .add(CollectionAddressFormEvent.setCity(city)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                        controller: _streetController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(),
                          labelText: S.current
                              .collectionAddressDialogStreetFormLabelText,
                          errorText:
                              state.validationError && state.street.isEmpty
                                  ? S.current.fieldRequiredErrorLabel
                                  : null,
                        ),
                        onChanged: (street) => collectionAddressFormBloc
                            .add(CollectionAddressFormEvent.setStreet(street)),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (state.validationError) {
                          return Text(
                            S.current
                                .collectionAddressDialogFieldsEmptyErrorLabel,
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
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child:
                      Text(S.current.collectionAddressDialogCancelButtonLabel),
                ),
                TextButton(
                  onPressed: () async {
                    collectionAddressFormBloc
                        .add(CollectionAddressFormEvent.checkValidation());
                    if (state.isFormValid) {
                      final address = state.toCollectionAddress;
                      if (widget.collectionId != null) {
                        await manageCollectionAddressCubit
                            .addAddressToCollection(
                          address,
                          widget.collectionId!,
                        );
                      }
                      Navigator.of(context).pop(address);
                    }
                  },
                  child: Text(S.current.collectionAddressDialogAddButtonLabel),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
