part of 'package:kordi_mobile/collections/controllers/create_collection_form/create_collection_form_bloc.dart';

@freezed
class CreateCollectionFormState with _$CreateCollectionFormState {
  const factory CreateCollectionFormState({
    required bool isLoading,
    required int id,
    required String name,
    required String description,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime? endTime,
    @DateTimeConverter() required DateTime? completedTime,
    required Uint8List? image,
    required int donates,
    @CollectionStatusConverter() required CollectionStatus status,
    required int userId,
    required List<CollectionAddress> addresses,
    required List<CollectionItem> items,
    required bool validationError,
  }) = _CreateCollectionFormState;
  factory CreateCollectionFormState.initial() => CreateCollectionFormState(
        isLoading: false,
        id: 0,
        name: '',
        description: '',
        startTime: DateTime.now(),
        endTime: null,
        completedTime: null,
        image: null,
        donates: 0,
        status: CollectionStatus.inProgress,
        userId: 0,
        addresses: [],
        items: [],
        validationError: false,
      );
}

extension CreateCollectionFormStateEx on CreateCollectionFormState {
  bool get isFirstStepValid => name.isNotEmpty && description.isNotEmpty;
  bool get isSecondStepValid => addresses.isNotEmpty;
  bool get isThirdStepValid => items.isNotEmpty;
  bool get canSaveCollection =>
      isFirstStepValid && isSecondStepValid && isThirdStepValid;
  CollectionDto get toCollectionDto => CollectionDto(
        title: name,
        description: description,
        endTime: endTime,
        userId: userId,
        addresses: addresses,
        items: items,
        image: image,
      );
}
