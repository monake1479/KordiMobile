import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/collection_item_form/collection_item_form_bloc.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/widgets/kordi_text_field.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/l10n.dart';

class CollectionItemDialog extends StatefulWidget {
  const CollectionItemDialog({
    super.key,
    required this.isEdit,
    required this.item,
  });

  final bool isEdit;
  final CollectionItem? item;

  static Future<CollectionItem?> show(
    BuildContext context, {
    bool isEdit = false,
    CollectionItem? item,
  }) async {
    return showDialog<CollectionItem?>(
      context: context,
      builder: (context) => CollectionItemDialog(
        isEdit: isEdit,
        item: item,
      ),
    );
  }

  @override
  State<CollectionItemDialog> createState() => _CollectionItemDialogState();
}

class _CollectionItemDialogState extends State<CollectionItemDialog> {
  late TextEditingController _nameController;
  late TextEditingController _maximumController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _maximumController = TextEditingController();
    if (widget.isEdit && widget.item != null) {
      _nameController.text = widget.item?.name ?? '';
      _maximumController.text = widget.item?.maxAmount.toString() ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return BlocProvider(
      create: (context) => getIt.get<CollectionItemFormBloc>(),
      child: BlocBuilder<CollectionItemFormBloc, CollectionItemFormState>(
        builder: (context, state) {
          final collectionItemFormBloc = context.read<CollectionItemFormBloc>();
          return AlertDialog(
            title: Text('Add item'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: KordiTextField(
                    controller: _nameController,
                    labelText: S.current.collectionItemDialogNameFormLabelText,
                    shouldShowErrorText:
                        state.validationError && state.name.isEmpty,
                    errorText: state.validationError && state.name.isEmpty
                        ? S.current.fieldRequiredErrorLabel
                        : null,
                    onChanged: (name) => collectionItemFormBloc.add(
                      CollectionItemFormEvent.setName(name),
                    ),
                  ),
                ),
                Text(S.current.collectionItemDialogCategoryFormLabelText),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: DropdownButton<CollectionItemCategory>(
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    value: state.category,
                    elevation: 12,
                    items: CollectionItemCategory.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text('${category.name}'),
                          ),
                        )
                        .toList(),
                    onChanged: (category) {
                      if (category == null) {
                        return;
                      }
                      collectionItemFormBloc.add(
                        CollectionItemFormEvent.setCategory(
                          category,
                        ),
                      );
                    },
                  ),
                ),
                Text(S.current.collectionItemDialogTypeFormLabelText),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Wrap(
                    children: CollectionItemType.values
                        .map(
                          (type) => Padding(
                            padding: const EdgeInsets.all(2),
                            child: ActionChip.elevated(
                              label: Text(
                                type.name,
                                style: textTheme.bodyLarge?.copyWith(
                                  color: state.type == type
                                      ? colorScheme.onPrimary
                                      : colorScheme.onSurface,
                                ),
                              ),
                              color: MaterialStateColor.resolveWith(
                                (states) => state.type == type
                                    ? colorScheme.primary
                                    : colorScheme.surface,
                              ),
                              onPressed: () {
                                collectionItemFormBloc.add(
                                  CollectionItemFormEvent.setType(type),
                                );
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (state.type.isUnlimited) {
                      return const SizedBox.shrink();
                    }
                    return KordiTextField(
                      controller: _maximumController,
                      labelText:
                          S.current.collectionItemDialogMaximumFormLabelText,
                      keyboardType: TextInputType.number,
                      suffixText: state.type.unitSuffix,
                      onChanged: (maxAmount) {
                        final int? value = int.tryParse(maxAmount);
                        if (value != null) {
                          collectionItemFormBloc.add(
                            CollectionItemFormEvent.setMaxAmount(value),
                          );
                        }
                      },
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    if (state.validationError) {
                      return Text(
                        S.current.collectionItemDialogFieldsEmptyErrorLabel,
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
                child: Text(S.current.collectionItemDialogCancelButtonLabel),
              ),
              TextButton(
                onPressed: () {
                  collectionItemFormBloc.add(
                    CollectionItemFormEvent.checkValidation(),
                  );
                  if (state.isFormValid) {
                    Navigator.of(context).pop(state.toCollectionItem);
                  }
                },
                child: Text(S.current.collectionItemDialogAddButtonLabel),
              ),
            ],
          );
        },
      ),
    );
  }
}
