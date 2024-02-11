part of 'package:kordi_mobile/collection_items/controllers/donation_form/donation_form_bloc.dart';

@freezed
class DonationFormEvent with _$DonationFormEvent {
  const factory DonationFormEvent.resetAmount() = _ResetAmount;
  const factory DonationFormEvent.setInitialState(
    CollectionItem collectionItem,
    int collectionId,
  ) = _SetInitialState;
  const factory DonationFormEvent.setAmount(
    int amount,
    CollectionItem item,
  ) = _SetAmount;
}
