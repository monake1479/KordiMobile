part of 'package:kordi_mobile/collections/pages/collection_edit_page.dart';

class _CollectionEditDescriptionCard extends StatelessWidget {
  const _CollectionEditDescriptionCard(this.description);
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final editCollectionFormBloc = context.read<EditCollectionFormBloc>();
    return BlocBuilder<EditCollectionFormBloc, EditCollectionFormState>(
      bloc: editCollectionFormBloc,
      builder: (context, state) {
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
                      S.current.collectionEditDescriptionLabel,
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  TextFormField(
                    initialValue: description,
                    minLines: 3,
                    maxLines: 10,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      border: OutlineInputBorder(),
                      errorText:
                          state.validationError && state.description.isEmpty
                              ? S.current.fieldRequiredErrorLabel
                              : null,
                      labelText:
                          S.current.collectionEditDescriptionFormLabelText,
                    ),
                    maxLength: 1000,
                    textAlign: TextAlign.justify,
                    onChanged: (description) {
                      context.read<EditCollectionFormBloc>().add(
                            EditCollectionFormEvent.setDescription(description),
                          );
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
}
