part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    required bool isLoading,
    required Option<Either<KordiException, Unit>> failureOrSuccessOption,
  }) = _SignUpState;
  factory SignUpState.initial() => SignUpState(
        isLoading: false,
        failureOrSuccessOption: none(),
      );
}

extension SignUpStateEx on SignUpState {
  KordiException? get exception => failureOrSuccessOption.fold(
        () => null,
        (either) => either.fold(
          (failure) => failure,
          (_) => null,
        ),
      );
}
