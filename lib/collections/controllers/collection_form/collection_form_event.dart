part of 'collection_form_bloc.dart';

@freezed
class CollectionFormEvent with _$CollectionFormEvent {
  const factory CollectionFormEvent.reset() = _Reset;
  const factory CollectionFormEvent.setInitial(
    int id,
  ) = _SetInitial;
  const factory CollectionFormEvent.setUserId(int userId) = _SetUserId;
  const factory CollectionFormEvent.setName(String name) = _SetName;
  const factory CollectionFormEvent.setDescription(String description) =
      _SetDescription;
  const factory CollectionFormEvent.setEndDate(DateTime endDate) = _SetEndDate;
  const factory CollectionFormEvent.setPhoto(String photo) = _SetPhoto;
  const factory CollectionFormEvent.setAddresses(
    List<CollectionAddress> addresses,
  ) = _SetAddresses;
  const factory CollectionFormEvent.addAddress(CollectionAddress address) =
      _AddAddress;
  const factory CollectionFormEvent.removeAddress(CollectionAddress address) =
      _RemoveAddress;
  const factory CollectionFormEvent.setItems(List<CollectionItem> items) =
      _SetItems;
  const factory CollectionFormEvent.addItem(CollectionItem item) = _AddItem;
  const factory CollectionFormEvent.removeItem(CollectionItem item) =
      _RemoveItem;
  const factory CollectionFormEvent.checkValidation() = _CheckValidation;
}
