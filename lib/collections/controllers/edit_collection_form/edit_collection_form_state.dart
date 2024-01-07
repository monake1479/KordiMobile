part of 'edit_collection_form_bloc.dart';

@freezed
class EditCollectionFormState with _$EditCollectionFormState {
  const factory EditCollectionFormState({
    required bool isLoading,
    required int id,
    required String name,
    required String description,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime? endTime,
    @DateTimeConverter() required DateTime? completedTime,
    // required Uint8List image,
    required int donates,
    @CollectionStatusConverter() required CollectionStatus status,
    required int userId,
    required bool validationError,
  }) = _EditCollectionFormState;
  factory EditCollectionFormState.initial() => EditCollectionFormState(
        isLoading: false,
        id: 0,
        name: '',
        description: '',
        startTime: DateTime.now(),
        endTime: null,
        completedTime: null,
        donates: 0,
        status: CollectionStatus.inProgress,
        userId: 0,
        validationError: false,
      );
}

extension EditCollectionFormStateX on EditCollectionFormState {
  bool get canEditCollection => name.isNotEmpty && description.isNotEmpty;

  EditCollectionDto get toEditCollectionDto => EditCollectionDto(
        id: id,
        title: name,
        description: description,
        userId: userId,
      );
}
