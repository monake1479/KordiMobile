part of 'create_collection_cubit.dart';

@freezed
class CreateCollectionState with _$CreateCollectionState {
  const factory CreateCollectionState({
    required Option<Either<KordiException, Unit>> failureOrSuccessOption,
    required bool isLoading,
  }) = _CreateCollectionState;
  factory CreateCollectionState.initial() => CreateCollectionState(
        failureOrSuccessOption: none(),
        isLoading: false,
      );
}

extension CreateCollectionStateX on CreateCollectionState {
  KordiException? get exception {
    return failureOrSuccessOption.fold(
      () => null,
      (either) => either.fold(
        (failure) => failure,
        (_) => null,
      ),
    );
  }
}
