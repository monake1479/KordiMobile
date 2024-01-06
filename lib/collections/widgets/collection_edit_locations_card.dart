part of 'package:kordi_mobile/collections/pages/collection_edit_page.dart';

class _CollectionEditLocationsTile extends StatelessWidget {
  const _CollectionEditLocationsTile();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.pin_drop_sharp,
                          color: colorScheme.primary,
                        ),
                      ),
                      Text(
                        S.current.collectionDetailsLocationsLabel,
                        style: theme.textTheme.bodyLarge,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      if (state.addresses.isEmpty) {
                        return Text(
                          S.current.collectionDetailsLocationsEmptyState,
                        );
                      }
                      return Column(
                        children: state.addresses
                            .map(
                              (address) => Row(
                                children: [
                                  Text('• '),
                                  Text(
                                    address.fullAddress,
                                    textAlign: TextAlign.left,
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await _onLocationButtonOnTap(
                                        address,
                                        context,
                                      );
                                    },
                                    icon: Icon(
                                      Icons.map_rounded,
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      editCollectionFormBloc.add(
                                        EditCollectionFormEvent.removeAddress(
                                          address,
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: colorScheme.error,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        colorScheme.onPrimary,
                      ),
                    ),
                    onPressed: () async {
                      await _onAddAddressButtonOnPressed(context);
                    },
                    child: Text(
                      S.current.collectionEditLocationsTileAddButtonLabel,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onAddAddressButtonOnPressed(
    BuildContext context,
  ) async {
    final result = await CollectionAddressDialog.show(context);
    if (result != null) {
      context.read<EditCollectionFormBloc>().add(
            EditCollectionFormEvent.addAddress(result),
          );
    }
  }

  Future<void> _onLocationButtonOnTap(
    CollectionAddress address,
    BuildContext context,
  ) async {
    if (!await canLaunchUrl(address.googleMapsUrl)) {
      await KordiDialog.showException(
        context,
        KordiException.customMessage(
          message: S.current.collectionDetailsAddressesUrlException,
        ),
      );
    }
    await launchUrl(address.googleMapsUrl);
  }
}
