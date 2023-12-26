part of 'collection_form_bloc.dart';

@freezed
class CollectionFormEvent with _$CollectionFormEvent {
  const factory CollectionFormEvent.reset() = _Reset;
  const factory CollectionFormEvent.setInitialCollection(
    int collectionId,
  ) = _SetInitialCollection;
}
