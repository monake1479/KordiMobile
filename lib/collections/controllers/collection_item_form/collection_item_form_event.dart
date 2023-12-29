part of 'collection_item_form_bloc.dart';

@freezed
class CollectionItemFormEvent with _$CollectionItemFormEvent {
  const factory CollectionItemFormEvent.setName(String name) = _SetName;
  const factory CollectionItemFormEvent.setType(CollectionItemType type) =
      _SetType;
  const factory CollectionItemFormEvent.setCategory(
    CollectionItemCategory category,
  ) = _SetCategory;
  const factory CollectionItemFormEvent.setMaxAmount(int maxAmount) =
      _SetMaxAmount;
  const factory CollectionItemFormEvent.checkValidation() = _CheckValidation;
}
