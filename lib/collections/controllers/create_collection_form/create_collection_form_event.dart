part of 'package:kordi_mobile/collections/controllers/create_collection_form/create_collection_form_bloc.dart';

@freezed
class CreateCollectionFormEvent with _$CreateCollectionFormEvent {
  const factory CreateCollectionFormEvent.reset() = _Reset;
  const factory CreateCollectionFormEvent.setName(String name) = _SetName;
  const factory CreateCollectionFormEvent.setDescription(String description) =
      _SetDescription;
  const factory CreateCollectionFormEvent.setEndDate(DateTime endDate) =
      _SetEndDate;
  const factory CreateCollectionFormEvent.setImage(Uint8List image) = _SetImage;
  const factory CreateCollectionFormEvent.addAddress(
    CollectionAddress address,
  ) = _AddAddress;
  const factory CreateCollectionFormEvent.removeAddress(
    CollectionAddress address,
  ) = _RemoveAddress;
  const factory CreateCollectionFormEvent.addItem(CollectionItem item) =
      _AddItem;
  const factory CreateCollectionFormEvent.removeItem(CollectionItem item) =
      _RemoveItem;
  const factory CreateCollectionFormEvent.checkValidation() = _CheckValidation;
}
