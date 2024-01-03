part of 'package:kordi_mobile/collections/pages/collection_edit_page.dart';

class _CollectionEditNameCard extends StatelessWidget {
  const _CollectionEditNameCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final collectionFormBloc = context.read<CollectionFormBloc>();

    return BlocBuilder<CollectionFormBloc, CollectionFormState>(
      builder: (context, state) {
        if (state.isLoading || state.name.isEmpty) {
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
                      S.current.collectionEditNameLabel,
                      style: textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  TextFormField(
                    initialValue: state.name,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      border: OutlineInputBorder(),
                      labelText: S.current.collectionEditFormLabelText,
                      errorText: state.validationError && state.name.isEmpty
                          ? S.current.fieldRequiredErrorLabel
                          : null,
                    ),
                    onChanged: (name) {
                      collectionFormBloc.add(CollectionFormEvent.setName(name));
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
