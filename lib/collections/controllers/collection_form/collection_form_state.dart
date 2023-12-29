part of 'collection_form_bloc.dart';

@freezed
class CollectionFormState with _$CollectionFormState {
  const factory CollectionFormState({
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
  }) = _CollectionFormState;
  factory CollectionFormState.initial() => CollectionFormState(
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

extension CollectionFormStateX on CollectionFormState {
  bool get isFirstStepValid => name.isNotEmpty && description.isNotEmpty;
  bool get isSecondStepValid => addresses.isNotEmpty;
  bool get isThirdStepValid => items.isNotEmpty;
  CollectionDto get toDto => CollectionDto(
        title: name,
        description: description,
        userId: userId,
        addresses: addresses,
        items: items,
      );
}
