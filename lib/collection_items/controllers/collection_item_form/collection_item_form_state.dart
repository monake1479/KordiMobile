part of 'collection_item_form_bloc.dart';

@freezed
class CollectionItemFormState with _$CollectionItemFormState {
  const factory CollectionItemFormState({
    required int? id,
    required String name,
    required CollectionItemType type,
    required CollectionItemCategory category,
    required int maxAmount,
    required int currentAmount,
    required bool validationError,
  }) = _CollectionItemFormState;
  factory CollectionItemFormState.initial() => CollectionItemFormState(
        id: null,
        name: '',
        type: CollectionItemType.weight,
        category: CollectionItemCategory.clothes,
        maxAmount: 0,
        currentAmount: 0,
        validationError: false,
      );
}

extension CollectionItemFormStateX on CollectionItemFormState {
  bool get isFormValid => name.isNotEmpty;
  CollectionItem get toCollectionItem => CollectionItem(
        id: id,
        name: name,
        type: type,
        category: category,
        currentAmount: currentAmount,
        maxAmount: maxAmount,
      );
}
