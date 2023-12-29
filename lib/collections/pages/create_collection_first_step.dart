part of 'package:kordi_mobile/collections/pages/create_collection_page.dart';

class CreateCollectionFirstStep extends StatefulWidget {
  const CreateCollectionFirstStep({super.key});

  @override
  State<CreateCollectionFirstStep> createState() =>
      _CreateCollectionFirstStepState();
}

class _CreateCollectionFirstStepState extends State<CreateCollectionFirstStep> {
  late TextEditingController _endDateController;
  @override
  void initState() {
    final endDate = context.read<CollectionFormBloc>().state.endTime;
    if (endDate != null) {
      _endDateController =
          TextEditingController(text: DateFormat('dd.MM.yyyy').format(endDate));
    } else {
      _endDateController = TextEditingController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final collectionFormBloc = context.read<CollectionFormBloc>();

    return BlocBuilder<CollectionFormBloc, CollectionFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      'Basic collection information',
                      textAlign: TextAlign.center,
                      style: textTheme.titleLarge,
                    ),
                    Text(
                      'Step 1 of 4',
                      textAlign: TextAlign.center,
                      style: textTheme.titleMedium!.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Please provide basic information about your collection',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge,
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: KordiTextField(
                        initialValue: state.name,
                        errorText: 'Field required',
                        shouldShowErrorText:
                            state.validationError && state.name.isEmpty,
                        labelText: 'Collection name*',
                        keyboardType: TextInputType.multiline,
                        onChanged: (name) {
                          collectionFormBloc
                              .add(CollectionFormEvent.setName(name));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: KordiTextField(
                        initialValue: state.description,
                        shouldShowErrorText:
                            state.validationError && state.description.isEmpty,
                        errorText: 'Field required',
                        labelText: 'Collection description*',
                        maxLength: 500,
                        keyboardType: TextInputType.multiline,
                        onChanged: (description) {
                          collectionFormBloc.add(
                            CollectionFormEvent.setDescription(description),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: KordiTextField(
                        controller: _endDateController,
                        labelText: 'Collection end date',
                        readOnly: true,
                        suffixIcon: Icon(
                          Icons.calendar_month_rounded,
                          color: colorScheme.primary,
                        ),
                        onTap: () async {
                          await _onCollectionEndDateFormOnTap(
                            context,
                          );
                        },
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Collection photo',
                        style: textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () {
                          log('TODO: Add photo');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border: Border.all(color: colorScheme.secondary),
                          ),
                          child: Assets.images.camera.svg(
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Tap image above to add photo',
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            Builder(
              builder: (context) {
                if (!state.validationError) {
                  return const SizedBox.shrink();
                }
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: Text(
                      'Please fill all required fields, indicated by *',
                      style: textTheme.bodyLarge!.copyWith(
                        color: colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ) +
                  EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  collectionFormBloc.add(CollectionFormEvent.checkValidation());
                  if (state.isFirstStepValid) {
                    CreateCollectionSecondStepRoute().go(context);
                  }
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

  Future<void> _onCollectionEndDateFormOnTap(
    BuildContext context,
  ) async {
    final endDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 3),
      ),
    );
    if (endDate != null) {
      _endDateController.text = DateFormat('dd.MM.yyyy').format(endDate);
      context
          .read<CollectionFormBloc>()
          .add(CollectionFormEvent.setEndDate(endDate));
    }
  }
}
