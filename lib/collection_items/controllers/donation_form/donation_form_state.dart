part of 'package:kordi_mobile/collection_items/controllers/donation_form/donation_form_bloc.dart';

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
  int fixedAmount(int currentAmount) {
    if (this.amount == currentAmount) {
      return 0;
    }
    if (currentAmount > 0 && this.amount == 0) {
      return 0;
    }
    if (currentAmount > this.amount) {
      return currentAmount;
    }
    if (currentAmount > 0 && this.amount > currentAmount) {
      return this.amount - currentAmount;
    }

    return this.amount;
  }

  DonationDto toDto(CollectionItem item) {
    int checkedAmount = this.amount;

    if (item.currentAmount! > 0 && checkedAmount > item.currentAmount!) {
      checkedAmount = this.amount - item.currentAmount!;
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
    if (currentAmount > 0 && this.amount == 0) {
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
