part of 'package:kordi_mobile/collection_comments/controllers/manage_collection_comments/manage_collection_comments_cubit.dart';

@freezed
class ManageCollectionCommentsState with _$ManageCollectionCommentsState {
  const factory ManageCollectionCommentsState({
    required bool isLoading,
    required Option<Either<KordiException, List<Comment>>>
        failureOrSuccessOption,
  }) = _ManageCollectionCommentsState;
  factory ManageCollectionCommentsState.initial() =>
      ManageCollectionCommentsState(
        isLoading: true,
        failureOrSuccessOption: none(),
      );
}

extension ManageCollectionCommentsStateEx on ManageCollectionCommentsState {
  List<Comment> get comments => failureOrSuccessOption.fold(
        () => [],
        (some) => some.fold(
          (_) => [],
          (comments) => comments,
        ),
      );
  KordiException? get exception => failureOrSuccessOption.fold(
        () => null,
        (some) => some.fold(
          (exception) => exception,
          (_) => null,
        ),
      );
}
