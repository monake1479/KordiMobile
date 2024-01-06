part of 'package:kordi_mobile/collection_items/controllers/manage_collection_items/manage_collection_items_cubit.dart';

@freezed
class ManageCollectionItemsState with _$ManageCollectionItemsState {
  const factory ManageCollectionItemsState({
    required bool isLoading,
    required Option<Either<KordiException, Unit>> failureOrSuccessOption,
    required List<CollectionItem> items,
  }) = _ManageCollectionItemsState;
  factory ManageCollectionItemsState.initial() => ManageCollectionItemsState(
        isLoading: false,
        failureOrSuccessOption: none(),
        items: [],
      );
}

extension ManageCollectionItemsStateX on ManageCollectionItemsState {
  KordiException? get exception => failureOrSuccessOption.fold(
        () => null,
        (either) => either.fold(
          (failure) => failure,
          (_) => null,
        ),
      );
}
