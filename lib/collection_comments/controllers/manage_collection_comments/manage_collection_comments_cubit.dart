import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collection_comments/interfaces/comments_interface.dart';
import 'package:kordi_mobile/collection_comments/models/comment.dart';
import 'package:kordi_mobile/collection_comments/models/comment_dto.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';
import 'package:kordi_mobile/user/models/user.dart';

part 'package:kordi_mobile/collection_comments/controllers/manage_collection_comments/manage_collection_comments_state.dart';

part 'manage_collection_comments_cubit.freezed.dart';

@injectable
class ManageCollectionCommentsCubit
    extends Cubit<ManageCollectionCommentsState> {
  ManageCollectionCommentsCubit(this._service)
      : super(ManageCollectionCommentsState.initial());
  final CommentsInterface _service;

  int _collectionId = 0;
  Future<void> get(
    int collectionId,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.get(collectionId);
    if (response.isLeft()) {
      emit(
        state.copyWith(
          isLoading: false,
          failureOrSuccessOption: some(left(response.getLeftOrThrow())),
        ),
      );
      return;
    }
    _collectionId = collectionId;
    emit(
      state.copyWith(
        isLoading: false,
        failureOrSuccessOption: some(right(response.getRightOrThrow())),
      ),
    );
  }

  Future<void> create(
    String commentContent,
    User user,
  ) async {
    emit(state.copyWith(isLoading: true));
    final dto = CommentDto(
      content: commentContent,
      collectionId: _collectionId,
      userId: user.id,
    );
    final response = await _service.create(dto);
    if (response.isLeft()) {
      emit(
        state.copyWith(
          isLoading: false,
          failureOrSuccessOption: some(left(response.getLeftOrThrow())),
        ),
      );
      return;
    }
    final Comment commentWithUsername = response.getRightOrThrow().copyWith(
          username: user.username,
        );
    final List<Comment> comments = List<Comment>.from(state.comments);
    comments.insert(0, commentWithUsername);
    emit(
      state.copyWith(
        isLoading: false,
        failureOrSuccessOption: some(right(comments)),
      ),
    );
  }

  Future<void> delete(
    int collectionId,
    int commentId,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.delete(collectionId, commentId);
    if (response.isLeft()) {
      emit(
        state.copyWith(
          isLoading: false,
          failureOrSuccessOption: some(left(response.getLeftOrThrow())),
        ),
      );
      return;
    }
    final List<Comment> comments = List<Comment>.from(state.comments);
    comments.removeWhere((element) => element.id == commentId);
    emit(
      state.copyWith(
        isLoading: false,
        failureOrSuccessOption: some(right(comments)),
      ),
    );
  }
}
