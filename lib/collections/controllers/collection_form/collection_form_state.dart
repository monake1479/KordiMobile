part of 'collection_form_bloc.dart';

@freezed
class CollectionFormState with _$CollectionFormState {
  const factory CollectionFormState({
    required bool isLoading,
    required int id,
    required String title,
    required String description,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime? endTime,
    @DateTimeConverter() required DateTime? completedTime,
    // required Uint8List image,
    required int donates,
    @CollectionStatusConverter() required CollectionStatus status,
    required int userId,
    required List<CollectionAddresses> addresses,
    required List<CollectionItem> items,
    required List<Comment>? comments,
  }) = _CollectionFormState;
  factory CollectionFormState.initial() => CollectionFormState(
        isLoading: false,
        id: 0,
        title: '',
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
      );
}
