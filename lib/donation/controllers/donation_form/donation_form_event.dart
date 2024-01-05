part of 'package:kordi_mobile/donation/controllers/donation_form/donation_form_bloc.dart';

@freezed
class DonationFormEvent with _$DonationFormEvent {
  const factory DonationFormEvent.setInitialState(
    CollectionItem collectionItem,
    int collectionId,
  ) = _SetInitialState;
  const factory DonationFormEvent.setAmount(
    int amount,
    int itemCurrentAmount,
  ) = _SetAmount;
}
