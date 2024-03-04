part of 'package:kordi_mobile/collections/pages/collection_details_page.dart';

class _CollectionDetailsLocationsTile extends StatelessWidget {
  const _CollectionDetailsLocationsTile();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final collectionIdString =
        GoRouterState.of(context).pathParameters['collectionId'];
    final collectionId = int.parse(collectionIdString!);

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
              BlocProvider<ManageCollectionAddressCubit>(
                create: (context) => getIt.get<ManageCollectionAddressCubit>()
                  ..setAddresses(collectionId),
                child: BlocBuilder<ManageCollectionAddressCubit,
                    ManageCollectionAddressState>(
                  builder: (context, state) {
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
                                ],
                              ),
                            )
                            .toList(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
