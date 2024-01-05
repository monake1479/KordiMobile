part of 'package:kordi_mobile/donation/controllers/donation_form/donation_form_bloc.dart';

@freezed
class DonationFormState with _$DonationFormState {
  const factory DonationFormState({
    required int collectionId,
    required int collectionItemId,
    required int amount,
  }) = _DonationFormState;
  factory DonationFormState.initial() => DonationFormState(
        collectionId: 0,
        collectionItemId: 0,
        amount: 0,
      );
}

extension DonationFormStateEx on DonationFormState {
  DonationDto toDto(int currentAmount) {
    int checkedAmount = this.amount;
    if (currentAmount > 0 && checkedAmount > currentAmount) {
      checkedAmount = this.amount - currentAmount;
    }
    return DonationDto(
      collectionItemId: collectionItemId,
      amount: checkedAmount,
    );
  }

  String amountString(
    int currentAmount,
  ) {
    if (this.amount == currentAmount) {
      return '0';
    }
    if (currentAmount > this.amount) {
      return currentAmount.toString();
    }
    if (currentAmount > 0 && this.amount > currentAmount) {
      return '${this.amount - currentAmount}';
    }

    return this.amount.toString();
  }
}
