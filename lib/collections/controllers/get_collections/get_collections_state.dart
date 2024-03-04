part of 'get_collections_cubit.dart';

@freezed
class GetCollectionsState with _$GetCollectionsState {
  const factory GetCollectionsState({
    required bool isLoading,
    required Option<Either<KordiException, Unit>> failureOrSuccessOption,
  }) = _GetCollectionsState;
  factory GetCollectionsState.initial() => GetCollectionsState(
        isLoading: false,
        failureOrSuccessOption: none(),
      );
}

extension GetCollectionsStateEx on GetCollectionsState {
  KordiException? get exception => failureOrSuccessOption.fold(
        () => null,
        (either) => either.fold(
          (failure) => failure,
          (_) => null,
        ),
      );
}
