import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';

part 'edit_collection_state.freezed.dart';

@freezed
class EditCollectionState with _$EditCollectionState {
  const factory EditCollectionState({
    required bool isLoading,
    required Option<Either<KordiException, Unit>> failureOrSuccessOption,
  }) = _EditCollectionState;
  factory EditCollectionState.initial() => EditCollectionState(
        isLoading: false,
        failureOrSuccessOption: none(),
      );
}

extension EditCollectionStateX on EditCollectionState {
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
