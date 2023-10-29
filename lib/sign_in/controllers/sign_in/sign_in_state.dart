part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    required bool isLoading,
    required Option<Either<KordiException, Unit>> failureOrSuccessOption,
  }) = _SignInState;
  factory SignInState.initial() => SignInState(
        isLoading: false,
        failureOrSuccessOption: none(),
      );
}

extension SignInStateX on SignInState {
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
