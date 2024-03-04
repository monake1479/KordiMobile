part of 'get_user_cubit.dart';

@freezed
class GetUserState with _$GetUserState {
  const factory GetUserState({
    required bool isLoading,
    required Option<Either<KordiException, User>> failureOrSuccessOption,
  }) = _GetUserState;
  factory GetUserState.initial() => GetUserState(
        isLoading: false,
        failureOrSuccessOption: none(),
      );
}

extension GetUserStateX on GetUserState {
  KordiException? get exception => failureOrSuccessOption.fold(
        () => null,
        (either) => either.fold(
          (failure) => failure,
          (_) => null,
        ),
      );
  User? get user => failureOrSuccessOption.fold(
        () => null,
        (either) => either.fold(
          (_) => null,
          (user) => user,
        ),
      );
}
