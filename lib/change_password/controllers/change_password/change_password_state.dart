part of 'change_password_bloc.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    required bool isLoading,
    required Option<Either<KordiException, Unit>> failureOrSuccessOption,
  }) = _ChangePasswordState;
  factory ChangePasswordState.initial() => ChangePasswordState(
        isLoading: false,
        failureOrSuccessOption: none(),
      );
}

extension ChangePasswordStateEx on ChangePasswordState {
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
