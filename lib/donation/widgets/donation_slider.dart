part of 'package:kordi_mobile/collections/pages/collection_details_page.dart';

class _DonationSlider extends StatelessWidget {
  const _DonationSlider({
    required this.item,
    required this.collectionId,
  });
  final CollectionItem item;
  final int collectionId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final authState = context.watch<AuthCubit>().state;
    if (!authState.isAuthorized) {
      return const SizedBox.shrink();
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider<DonationCubit>(
          create: (context) => getIt.get<DonationCubit>(),
        ),
        BlocProvider<DonationFormBloc>(
          create: (context) => getIt.get<DonationFormBloc>()
            ..add(
              DonationFormEvent.setInitialState(
                item,
                collectionId,
              ),
            ),
        ),
      ],
      child: BlocListener<DonationCubit, DonationState>(
        listener: (context, donationState) async {
          if (donationState.exception != null) {
            await KordiDialog.showException(
              context,
              donationState.exception!,
            );
          }
        },
        child: BlocBuilder<DonationFormBloc, DonationFormState>(
          builder: (context, state) {
            final donationCubit = context.read<DonationCubit>();
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
                    value: state.amount.toDouble(),
                    max: item.maxAmount.toDouble(),
                    label: '${state.amount}',
                    divisions: item.maxAmount,
                    onChanged: (amount) {
                      donationFormBloc.add(
                        DonationFormEvent.setAmount(
                          amount.toInt(),
                          item.currentAmount!,
                        ),
                      );
                    },
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (state.amount == 0) {
                      return const SizedBox.shrink();
                    }

                    return ElevatedButton(
                      onPressed: () async {
                        await donationCubit.donate(
                          state.toDto(item.currentAmount!),
                          collectionId,
                        );
                        context.read<CollectionsFilterBloc>().add(
                              CollectionsFilterEvent.getById(
                                collectionId,
                              ),
                            );
                        context.read<CollectionFormBloc>().add(
                              CollectionFormEvent.donateItem(
                                state.toDto(item.currentAmount! + state.amount),
                              ),
                            );
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
        ),
      ),
    );
  }
}
