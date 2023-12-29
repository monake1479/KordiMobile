part of 'collection_item_form_bloc.dart';

@freezed
class CollectionItemFormState with _$CollectionItemFormState {
  const factory CollectionItemFormState({
    required String name,
    required CollectionItemType type,
    required CollectionItemCategory category,
    required int maxAmount,
    required bool validationError,
  }) = _CollectionItemFormState;
  factory CollectionItemFormState.initial() => CollectionItemFormState(
        name: '',
        type: CollectionItemType.weight,
        category: CollectionItemCategory.clothes,
        maxAmount: 0,
        validationError: false,
      );
}

extension CollectionItemFormStateX on CollectionItemFormState {
  bool get isFormValid => name.isNotEmpty;
  CollectionItem get toCollectionItem => CollectionItem(
        id: null,
        name: name,
        type: type,
        category: category,
        currentAmount: null,
        maxAmount: maxAmount,
      );
}
