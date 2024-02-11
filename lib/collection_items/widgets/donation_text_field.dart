part of 'package:kordi_mobile/collections/pages/collection_details_page.dart';

class _DonationTextField extends StatefulWidget {
  const _DonationTextField({required this.item});

  final CollectionItem item;

  @override
  State<_DonationTextField> createState() => __DonationTextFieldState();
}

class __DonationTextFieldState extends State<_DonationTextField> {
  late TextEditingController _amountController;
  @override
  void initState() {
    _amountController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonationFormBloc, DonationFormState>(
      builder: (context, state) {
        final collectionIdString =
            GoRouterState.of(context).pathParameters['collectionId'];
        final collectionId = int.parse(collectionIdString!);
        final manageCollectionItemsCubit =
            context.read<ManageCollectionItemsCubit>();
        final donationFormBloc = context.read<DonationFormBloc>();
        return Column(
          children: [
            Builder(
              builder: (context) {
                if (widget.item.type.isUnlimited) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        S.current.collectionDetailsItemDonateLabel,
                      ),
                      Text(
                        state.amountString(
                          widget.item.currentAmount!,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            TextFormField(
              controller: _amountController,
              maxLength: 18,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(),
                labelText: S.current.collectionDetailsItemDonateLabel,
              ),
              onChanged: (amount) {
                if (amount.isEmpty) {
                  return;
                }
                if (amount.startsWith('0')) {
                  _amountController.text = amount.substring(1);
                  return;
                }
                donationFormBloc.add(
                  DonationFormEvent.setAmount(
                    int.parse(amount),
                    widget.item,
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                if (state.amount == 0 ||
                    (state.fixedAmount(widget.item.currentAmount!) == 0 &&
                        !widget.item.type.isUnlimited)) {
                  return const SizedBox.shrink();
                }

                return ElevatedButton(
                  onPressed: () async {
                    await manageCollectionItemsCubit.donate(
                      state.toDto(widget.item),
                      collectionId,
                    );
                    context.read<CollectionsFilterBloc>().add(
                          CollectionsFilterEvent.getById(
                            collectionId,
                          ),
                        );
                    manageCollectionItemsCubit.updateDonation(
                      state.toDto(widget.item),
                    );
                    donationFormBloc.add(DonationFormEvent.resetAmount());
                    _amountController.text = '';
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
