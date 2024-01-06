part of 'package:kordi_mobile/collections/controllers/create_collection_form/create_collection_form_bloc.dart';

@freezed
class CreateEditCollectionFormState with _$CreateEditCollectionFormState {
  const factory CreateEditCollectionFormState({
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
    required List<CollectionAddress> addresses,
    required List<CollectionItem> items,
    required List<Comment>? comments,
    required bool validationError,
  }) = _CreateEditCollectionFormState;
  factory CreateEditCollectionFormState.initial() =>
      CreateEditCollectionFormState(
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
        addresses: [],
        items: [],
        comments: [],
        validationError: false,
      );
}

extension CreateEditCollectionFormStateEx on CreateEditCollectionFormState {
  bool get isFirstStepValid => name.isNotEmpty && description.isNotEmpty;
  bool get isSecondStepValid => addresses.isNotEmpty;
  bool get isThirdStepValid => items.isNotEmpty;
  bool get canSaveCollection =>
      isFirstStepValid && isSecondStepValid && isThirdStepValid;
  CollectionDto get toCollectionDto => CollectionDto(
        title: name,
        description: description,
        userId: userId,
        addresses: addresses,
        items: items,
      );
}
