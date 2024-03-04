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
  const factory EditCollectionFormEvent.setEndTime(DateTime endTime) =
      _SetEndTime;
  const factory EditCollectionFormEvent.checkValidation() = _CheckValidation;
}
