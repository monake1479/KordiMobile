part of 'package:kordi_mobile/collections/pages/collection_details_page.dart';

class _DonationSection extends StatelessWidget {
  const _DonationSection({
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

    return BlocProvider<DonationFormBloc>(
      create: (context) => getIt.get<DonationFormBloc>()
        ..add(
          DonationFormEvent.setInitialState(
            item,
            collectionId,
          ),
        ),
      child:
          BlocListener<ManageCollectionItemsCubit, ManageCollectionItemsState>(
        listener: (context, manageCollectionItemsState) async {
          if (manageCollectionItemsState.exception != null) {
            await KordiDialog.showException(
              context,
              manageCollectionItemsState.exception!,
            );
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
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
            if (!authState.isAuthorized) {
              return const SizedBox.shrink();
            }

            if (item.type.isUnlimited) {
              return _DonationTextField(
                item: item,
              );
            }
            return _DonationSlider(
              item: item,
            );
          },
        ),
      ),
    );
  }
}
