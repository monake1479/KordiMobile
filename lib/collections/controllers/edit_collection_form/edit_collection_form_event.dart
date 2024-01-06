part of 'edit_collection_form_bloc.dart';

@freezed
class EditCollectionFormEvent with _$EditCollectionFormEvent {
  const factory EditCollectionFormEvent.reset() = _Reset;
  const factory EditCollectionFormEvent.setInitial(
    int id,
  ) = _SetInitial;
  const factory EditCollectionFormEvent.setUserId(int userId) = _SetUserId;
  const factory EditCollectionFormEvent.setName(String name) = _SetName;
  const factory EditCollectionFormEvent.setDescription(String description) =
      _SetDescription;
  const factory EditCollectionFormEvent.setPhoto(String photo) = _SetPhoto;
  const factory EditCollectionFormEvent.addAddress(CollectionAddress address) =
      _AddAddress;
  const factory EditCollectionFormEvent.removeAddress(
    CollectionAddress address,
  ) = _RemoveAddress;
  const factory EditCollectionFormEvent.checkValidation() = _CheckValidation;
}
