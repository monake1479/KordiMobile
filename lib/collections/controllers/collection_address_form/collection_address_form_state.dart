part of 'collection_address_form_bloc.dart';

@freezed
class CollectionAddressFormState with _$CollectionAddressFormState {
  const factory CollectionAddressFormState({
    required String city,
    required String street,
    required bool validationError,
  }) = _CollectionAddressFormState;
  factory CollectionAddressFormState.initial() => CollectionAddressFormState(
        city: '',
        street: '',
        validationError: false,
      );
}

extension CollectionAddressFormStateX on CollectionAddressFormState {
  bool get isFormValid => city.isNotEmpty && street.isNotEmpty;
  CollectionAddress get toCollectionAddress => CollectionAddress(
        city: city,
        street: street,
      );
}
