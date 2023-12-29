part of 'package:kordi_mobile/collections/pages/create_collection_page.dart';

class CreateCollectionSecondStep extends StatelessWidget {
  const CreateCollectionSecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final GlobalKey<ShakeErrorState> _shakeErrorKey =
        GlobalKey<ShakeErrorState>();
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
                            'Collection addresses',
                            textAlign: TextAlign.center,
                            style: textTheme.titleLarge,
                          ),
                          Text(
                            'Step 2 of 4',
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
                                Text('City', style: textTheme.bodyLarge),
                                Text('Address', style: textTheme.bodyLarge),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (state.addresses.isEmpty) {
                                return ShakeError(
                                  key: _shakeErrorKey,
                                  child: Text(
                                    'Please provide addresses where donates can be stored',
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
                                  children: state.addresses
                                      .map(
                                        (address) =>
                                            CreateCollectionAddressTile(
                                          address: address,
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
                                await _onAddAddressButtonOnPressed(context);
                              },
                              child: Text(
                                'Add address',
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
              child: ElevatedButton(
                onPressed: () {
                  if (state.isSecondStepValid) {
                    CreateCollectionThirdStepRoute().go(context);
                    return;
                  }
                  _shakeErrorKey.currentState?.shake();
                },
                child: Text(
                  'Next step',
                  style: textTheme.bodyLarge!.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _onAddAddressButtonOnPressed(
    BuildContext context,
  ) async {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final result = await showDialog<CollectionAddress?>(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => getIt.get<CollectionAddressFormBloc>(),
          child: BlocBuilder<CollectionAddressFormBloc,
              CollectionAddressFormState>(
            builder: (context, state) {
              final collectionAddressFormBloc =
                  context.read<CollectionAddressFormBloc>();
              return AlertDialog(
                title: Text('Add address'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: KordiTextField(
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
      },
    );
    if (result != null) {
      context.read<CollectionFormBloc>().add(
            CollectionFormEvent.addAddress(result),
          );
    }
  }
}
