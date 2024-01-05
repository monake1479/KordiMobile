part of 'package:kordi_mobile/donation/controllers/donation/donation_cubit.dart';

@freezed
class DonationState with _$DonationState {
  const factory DonationState({
    required bool isLoading,
    required Option<Either<KordiException, Unit>> failureOrSuccessOption,
  }) = _DonationState;
  factory DonationState.initial() => DonationState(
        isLoading: false,
        failureOrSuccessOption: none(),
      );
}

extension DonationStateX on DonationState {
  KordiException? get exception => failureOrSuccessOption.fold(
        () => null,
        (either) => either.fold(
          (failure) => failure,
          (_) => null,
        ),
      );
}
