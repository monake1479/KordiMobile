part of 'package:kordi_mobile/collections/pages/collection_edit_page.dart';

class _CollectionEditDescriptionCard extends StatelessWidget {
  const _CollectionEditDescriptionCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final collectionFormBloc = context.read<CollectionFormBloc>();
    return BlocBuilder<CollectionFormBloc, CollectionFormState>(
      bloc: collectionFormBloc,
      builder: (context, state) {
        if (state.isLoading || state.description.isEmpty) {
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
                      S.current.collectionEditDescriptionLabel,
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  TextFormField(
                    initialValue: state.description,
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
                    maxLength: 500,
                    textAlign: TextAlign.justify,
                    onChanged: (description) {
                      context.read<CollectionFormBloc>().add(
                            CollectionFormEvent.setDescription(description),
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
