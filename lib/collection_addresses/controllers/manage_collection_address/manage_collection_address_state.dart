part of 'package:kordi_mobile/collection_addresses/controllers/manage_collection_address/manage_collection_address_cubit.dart';

@freezed
class ManageCollectionAddressState with _$ManageCollectionAddressState {
  const factory ManageCollectionAddressState({
    required bool isLoading,
    required Option<Either<KordiException, Unit>> failureOrSuccessOption,
    required List<CollectionAddress> addresses,
  }) = _ManageCollectionAddressState;
  factory ManageCollectionAddressState.initial() =>
      ManageCollectionAddressState(
        isLoading: false,
        failureOrSuccessOption: none(),
        addresses: [],
      );
}

extension ManageCollectionAddressStateX on ManageCollectionAddressState {
  KordiException? get exception => failureOrSuccessOption.fold(
        () => null,
        (either) => either.fold(
          (failure) => failure,
          (_) => null,
        ),
      );
}
