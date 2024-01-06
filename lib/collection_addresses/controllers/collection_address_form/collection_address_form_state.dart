part of 'collection_address_form_bloc.dart';

@freezed
class CollectionAddressFormState with _$CollectionAddressFormState {
  const factory CollectionAddressFormState({
    required int? id,
    required String city,
    required String street,
    required bool validationError,
  }) = _CollectionAddressFormState;
  factory CollectionAddressFormState.initial() => CollectionAddressFormState(
        id: null,
        city: '',
        street: '',
        validationError: false,
      );
}

extension CollectionAddressFormStateX on CollectionAddressFormState {
  bool get isFormValid => city.isNotEmpty && street.isNotEmpty;
  CollectionAddress get toCollectionAddress => CollectionAddress(
        id: id,
        city: city,
        street: street,
      );
}
