part of 'package:kordi_mobile/collections/pages/collection_details_page.dart';

class _DonationSlider extends StatelessWidget {
  const _DonationSlider({
    required this.item,
  });
  final CollectionItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final collectionIdString =
        GoRouterState.of(context).pathParameters['collectionId'];
    final collectionId = int.parse(collectionIdString!);

    return BlocBuilder<DonationFormBloc, DonationFormState>(
      builder: (context, state) {
        final manageCollectionItemsCubit =
            context.read<ManageCollectionItemsCubit>();
        final donationFormBloc = context.read<DonationFormBloc>();
        if (item.isFinished) {
          return Text(
            S.current.collectionDetailsItemCompletedLabel,
            textAlign: TextAlign.center,
            style: textTheme.titleMedium!.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          );
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(
                    S.current.collectionDetailsItemDonateLabel,
                  ),
                  Text(
                    state.amountString(
                      item.currentAmount!,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Slider(
                value: item.currentAmount != null &&
                        (item.currentAmount! > state.amount)
                    ? item.currentAmount?.toDouble() ?? 0
                    : state.amount.toDouble(),
                max: item.maxAmount.toDouble(),
                label: state.amountString(
                  item.currentAmount!,
                ),
                divisions: item.maxAmount,
                onChanged: (amount) {
                  donationFormBloc.add(
                    DonationFormEvent.setAmount(
                      amount.toInt(),
                      item,
                    ),
                  );
                },
              ),
            ),
            Builder(
              builder: (context) {
                if (state.amount == 0 ||
                    state.fixedAmount(item.currentAmount!) == 0) {
                  return const SizedBox.shrink();
                }

                return ElevatedButton(
                  onPressed: () async {
                    await manageCollectionItemsCubit.donate(
                      state.toDto(item),
                      collectionId,
                    );
                    context.read<CollectionsFilterBloc>().add(
                          CollectionsFilterEvent.getById(
                            collectionId,
                          ),
                        );
                    donationFormBloc.add(DonationFormEvent.resetAmount());
                    manageCollectionItemsCubit
                        .updateDonation(state.toDto(item));
                  },
                  child: Text(
                    S.current.collectionDetailsItemDonateButtonLabel,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
