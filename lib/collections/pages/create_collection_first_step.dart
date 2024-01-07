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
    final endDate = context.read<CreateCollectionFormBloc>().state.endTime;
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
    final createCollectionFormBloc = context.read<CreateCollectionFormBloc>();

    return BlocBuilder<CreateCollectionFormBloc, CreateCollectionFormState>(
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
                      S.current.createCollectionFirstStepTitle,
                      textAlign: TextAlign.center,
                      style: textTheme.titleLarge,
                    ),
                    Text(
                      S.current.createCollectionFirstStepSubtitle,
                      textAlign: TextAlign.center,
                      style: textTheme.titleMedium!.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      S.current.createCollectionFirstStepInformation,
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
                      child: TextFormField(
                        initialValue: state.name,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(),
                          errorText:
                              (state.validationError && state.name.isEmpty)
                                  ? S.current.fieldRequiredErrorLabel
                                  : null,
                          labelText: S.current
                              .createCollectionFirstStepNameFormTextLabel,
                        ),
                        keyboardType: TextInputType.multiline,
                        onChanged: (name) {
                          createCollectionFormBloc
                              .add(CreateCollectionFormEvent.setName(name));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                        initialValue: state.description,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(),
                          errorText: (state.validationError &&
                                  state.description.isEmpty)
                              ? S.current.fieldRequiredErrorLabel
                              : null,
                          labelText: S.current
                              .createCollectionFirstStepDescriptionFormTextLabel,
                        ),
                        maxLength: 500,
                        keyboardType: TextInputType.multiline,
                        onChanged: (description) {
                          createCollectionFormBloc.add(
                            CreateCollectionFormEvent.setDescription(
                              description,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                        controller: _endDateController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(),
                          labelText: S.current
                              .createCollectionFirstStepEndDateFormTextLabel,
                          suffixIcon: Icon(
                            Icons.calendar_month_rounded,
                            color: colorScheme.primary,
                          ),
                        ),
                        readOnly: true,
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
                        S.current.createCollectionFirstStepPhotoLabel,
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
                      S.current.createCollectionFirstStepPhotoHintLabel,
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
                      S.current.createCollectionFirstStepValidationHint,
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
                  createCollectionFormBloc
                      .add(CreateCollectionFormEvent.checkValidation());
                  if (state.isFirstStepValid) {
                    CreateCollectionSecondStepRoute().go(context);
                  }
                },
                child: Text(
                  S.current.createCollectionFirstStepNextStepButtonLabel,
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
          .read<CreateCollectionFormBloc>()
          .add(CreateCollectionFormEvent.setEndDate(endDate));
    }
  }
}
