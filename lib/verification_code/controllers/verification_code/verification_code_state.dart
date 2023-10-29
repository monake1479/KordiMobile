part of 'verification_code_bloc.dart';

@freezed
class VerificationCodeState with _$VerificationCodeState {
  const factory VerificationCodeState({
    required bool isLoading,
    required Option<Either<KordiException, Unit>> failureOrSuccessOption,
  }) = _VerificationCodeState;
  factory VerificationCodeState.initial() => VerificationCodeState(
        isLoading: false,
        failureOrSuccessOption: none(),
      );
}

extension VerificationCodeStateEx on VerificationCodeState {
  KordiException? get exception => failureOrSuccessOption.fold(
        () => null,
        (either) => either.fold(
          (failure) => failure,
          (_) => null,
        ),
      );
  bool get isSuccess => failureOrSuccessOption.fold(
        () => false,
        (either) => either.fold(
          (_) => false,
          (_) => true,
        ),
      );
}
