part of 'collection_address_form_bloc.dart';

@freezed
class CollectionAddressFormEvent with _$CollectionAddressFormEvent {
  const factory CollectionAddressFormEvent.setCity(
    String city,
  ) = _SetCity;
  const factory CollectionAddressFormEvent.setStreet(
    String street,
  ) = _SetStreet;
  const factory CollectionAddressFormEvent.checkValidation() = _CheckValidation;
}
