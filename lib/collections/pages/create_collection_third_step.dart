part of 'package:kordi_mobile/collections/pages/create_collection_page.dart';

class CreateCollectionThirdStep extends StatelessWidget {
  const CreateCollectionThirdStep({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final _shakeErrorKey = GlobalKey<ShakeErrorState>();
    return BlocBuilder<CreateCollectionFormBloc, CreateEditCollectionFormState>(
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
                            S.current.createCollectionThirdStepTitle,
                            textAlign: TextAlign.center,
                            style: textTheme.titleLarge,
                          ),
                          Text(
                            S.current.createCollectionThirdStepSubtitle,
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
                                  S.current.createCollectionThirdStepNameLabel,
                                  style: textTheme.bodyLarge,
                                ),
                                Text(
                                  S.current
                                      .createCollectionThirdStepCategoryLabel,
                                  style: textTheme.bodyLarge,
                                ),
                                Text(
                                  S.current.createCollectionThirdStepTypeLabel,
                                  style: textTheme.bodyLarge,
                                ),
                                Text(
                                  S.current
                                      .createCollectionThirdStepMaximumLabel,
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
                                    S.current
                                        .createCollectionThirdStepInformation,
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
                                S.current
                                    .createCollectionThirdStepAddItemButtonLabel,
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
                          await createCollectionCubit
                              .create(state.toCollectionDto);
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
                            S.current
                                .createCollectionThirdStepNextStepButtonLabel,
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
    final result = await CollectionItemDialog.show(
      context,
    );
    if (result != null) {
      context.read<CreateCollectionFormBloc>().add(
            CreateCollectionFormEvent.addItem(result),
          );
    }
  }
}
