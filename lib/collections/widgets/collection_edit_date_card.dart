part of 'package:kordi_mobile/collections/pages/collection_edit_page.dart';

class _CollectionEditDateCard extends StatelessWidget {
  const _CollectionEditDateCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return BlocBuilder<EditCollectionFormBloc, EditCollectionFormState>(
      builder: (context, state) {
        final _controller = TextEditingController(
          text: state.formattedEndTime,
        );
        if (state.endTime == null) {
          return SliverToBoxAdapter(child: const SizedBox.shrink());
        }
        if (state.isLoading) {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      S.current.collectionEditEndTimeLabel,
                      style: textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  TextFormField(
                    controller: TextEditingController(
                      text: state.formattedEndTime,
                    ),
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
                      final endTime = await _onCollectionEndDateFormOnTap(
                        context,
                        state.endTime,
                      );
                      if (endTime != null) {
                        _controller.text =
                            DateFormat('dd.MM.yyyy').format(endTime);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<DateTime?> _onCollectionEndDateFormOnTap(
    BuildContext context,
    DateTime? initialDate,
  ) async {
    final endDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 3),
      ),
    );
    if (endDate != null) {
      context
          .read<EditCollectionFormBloc>()
          .add(EditCollectionFormEvent.setEndTime(endDate));
      return endDate;
    }
    return null;
  }
}
