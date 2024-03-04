part of 'package:kordi_mobile/collections/pages/collection_edit_page.dart';

class _CollectionEditLocationsTile extends StatelessWidget {
  const _CollectionEditLocationsTile();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocConsumer<ManageCollectionAddressCubit,
        ManageCollectionAddressState>(
      listener: (context, state) async {
        if (state.exception != null) {
          await KordiDialog.showException(
            context,
            state.exception!,
          );
        }
      },
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
                      Flexible(
                        child: Text(
                          S.current.collectionDetailsLocationsLabel,
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.justify,
                        ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.current.collectionDetailsLocationsHint,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          ...state.addresses
                              .map(
                                (address) => Row(
                                  children: [
                                    Text('• '),
                                    Flexible(
                                      child: Text(
                                        address.fullAddress,
                                        textAlign: TextAlign.left,
                                      ),
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
                                    IconButton(
                                      onPressed: () {
                                        context
                                            .read<
                                                ManageCollectionAddressCubit>()
                                            .removeAddress(
                                              address,
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
                        ],
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
      context.read<ManageCollectionAddressCubit>().addAddress(
            result,
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
