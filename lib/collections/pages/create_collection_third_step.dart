part of 'package:kordi_mobile/collections/pages/create_collection_page.dart';

class CreateCollectionThirdStep extends StatelessWidget {
  const CreateCollectionThirdStep({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final _shakeErrorKey = GlobalKey<ShakeErrorState>();
    return BlocBuilder<CollectionFormBloc, CollectionFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                physics: ClampingScrollPhysics(),
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
                            'Collection items',
                            textAlign: TextAlign.center,
                            style: textTheme.titleLarge,
                          ),
                          Text(
                            'Step 3 of 4',
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
                          Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colorScheme.primary,
                                width: 1.75,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Name',
                                  style: textTheme.bodyLarge,
                                ),
                                Text(
                                  'Category',
                                  style: textTheme.bodyLarge,
                                ),
                                Text(
                                  'Type',
                                  style: textTheme.bodyLarge,
                                ),
                                Text(
                                  'Maximum quantity',
                                  style: textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (state.items.isEmpty) {
                                return ShakeError(
                                  key: _shakeErrorKey,
                                  child: Text(
                                    'Please provide items that collection needs',
                                    textAlign: TextAlign.center,
                                    style: textTheme.bodyLarge,
                                  ),
                                );
                              }
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: colorScheme.primary,
                                    width: 1.75,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                child: ListView(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  children: state.items
                                      .map(
                                        (item) => CreateCollectionItemTile(
                                          item: item,
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                await _onAddItemButtonOnPressed(context);
                              },
                              child: Text(
                                'Add item',
                                style: textTheme.bodyLarge!.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ) +
                  EdgeInsets.only(bottom: 20),
              child: BlocProvider(
                create: (context) => getIt.get<CreateCollectionCubit>(),
                child:
                    BlocConsumer<CreateCollectionCubit, CreateCollectionState>(
                  listener: (context, createCollectionState) async {
                    if (createCollectionState.exception != null) {
                      await KordiDialog.showException(
                        context,
                        createCollectionState.exception!,
                      );
                    }
                  },
                  builder: (context, createCollectionState) {
                    final createCollectionCubit =
                        context.read<CreateCollectionCubit>();
                    return ElevatedButton(
                      onPressed: () async {
                        if (state.isThirdStepValid) {
                          await createCollectionCubit.create(state.toDto);
                          if (createCollectionState.exception == null) {
                            CreateCollectionFourthStepRoute().go(context);
                          }
                        }
                        _shakeErrorKey.currentState?.shake();
                      },
                      child: Builder(
                        builder: (context) {
                          if (createCollectionState.isLoading) {
                            return const CircularProgressIndicator();
                          }
                          return Text(
                            'Next step',
                            style: textTheme.bodyLarge!.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _onAddItemButtonOnPressed(
    BuildContext context,
  ) async {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final result = await showDialog<CollectionItem?>(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => getIt.get<CollectionItemFormBloc>(),
          child: BlocBuilder<CollectionItemFormBloc, CollectionItemFormState>(
            builder: (context, state) {
              final collectionItemFormBloc =
                  context.read<CollectionItemFormBloc>();
              return AlertDialog(
                title: Text('Add item'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: KordiTextField(
                        labelText: 'Name',
                        shouldShowErrorText:
                            state.validationError && state.name.isEmpty,
                        errorText: state.validationError && state.name.isEmpty
                            ? 'Field required'
                            : null,
                        onChanged: (name) => collectionItemFormBloc.add(
                          CollectionItemFormEvent.setName(name),
                        ),
                      ),
                    ),
                    Text('Category'),
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
                    Text('Type'),
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
                    KordiTextField(
                      labelText: 'Maximum quantity',
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
                      collectionItemFormBloc.add(
                        CollectionItemFormEvent.checkValidation(),
                      );
                      if (state.isFormValid) {
                        Navigator.of(context).pop(state.toCollectionItem);
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
    if (result != null) {
      context.read<CollectionFormBloc>().add(
            CollectionFormEvent.addItem(result),
          );
    }
  }
}
