import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/collection_items/controllers/collection_item_form/collection_item_form_bloc.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/l10n.dart';

class CollectionItemDialog extends StatefulWidget {
  const CollectionItemDialog({
    super.key,
    required this.item,
  });

  final CollectionItem? item;

  static Future<CollectionItem?> show(
    BuildContext context, {
    CollectionItem? item,
  }) async {
    return showAdaptiveDialog<CollectionItem?>(
      context: context,
      builder: (context) => CollectionItemDialog(
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
  late TextEditingController _currentController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _maximumController = TextEditingController();
    _currentController = TextEditingController();
    if (widget.item != null) {
      _nameController.text = widget.item!.name;
      _maximumController.text = widget.item!.maxAmount.toString();
      _currentController.text = '${widget.item?.currentAmount ?? 0}';
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
        if (widget.item != null) {
          return getIt.get<CollectionItemFormBloc>()
            ..add(CollectionItemFormEvent.setInitial(widget.item!));
        }
        return getIt.get<CollectionItemFormBloc>();
      },
      child: BlocBuilder<CollectionItemFormBloc, CollectionItemFormState>(
        builder: (context, state) {
          final collectionItemFormBloc = context.read<CollectionItemFormBloc>();
          return AlertDialog.adaptive(
            title: Text(
              widget.item != null
                  ? S.current.collectionItemDialogEditTitle
                  : S.current.collectionItemDialogAddTitle,
            ),
            content: Material(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextFormField(
                          readOnly: widget.item != null,
                          controller: _nameController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8),
                            border: OutlineInputBorder(),
                            labelText:
                                S.current.collectionItemDialogNameFormLabelText,
                            errorText:
                                state.validationError && state.name.isEmpty
                                    ? S.current.fieldRequiredErrorLabel
                                    : null,
                          ),
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
                            if (widget.item != null) {
                              return;
                            }
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
                                            : colorScheme.onSecondary,
                                      ),
                                    ),
                                    color: MaterialStateColor.resolveWith(
                                      (states) => state.type == type
                                          ? colorScheme.primary
                                          : colorScheme.secondary,
                                    ),
                                    onPressed: () {
                                      if (widget.item != null) {
                                        return;
                                      }
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
                          return TextFormField(
                            controller: _maximumController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(),
                              labelText: S.current
                                  .collectionItemDialogMaximumFormLabelText,
                              suffixText: state.type.unitSuffix,
                            ),
                            keyboardType: TextInputType.number,
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
                          if (state.type.isUnlimited) {
                            return const SizedBox.shrink();
                          }
                          if (widget.item != null) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: TextFormField(
                                controller: _currentController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(8),
                                  border: OutlineInputBorder(),
                                  labelText: S.current
                                      .collectionItemDialogCurrentFormLabelText,
                                  suffixText: state.type.unitSuffix,
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (currentAmount) {
                                  final int? value =
                                      int.tryParse(currentAmount);
                                  if (value != null) {
                                    collectionItemFormBloc.add(
                                      CollectionItemFormEvent.setCurrentAmount(
                                        value,
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      Builder(
                        builder: (context) {
                          if (state.validationError) {
                            return Text(
                              S.current
                                  .collectionItemDialogFieldsEmptyErrorLabel,
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
              ),
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
                child: Text(
                  widget.item != null
                      ? S.current.collectionItemDialogEditButtonLabel
                      : S.current.collectionItemDialogAddButtonLabel,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
