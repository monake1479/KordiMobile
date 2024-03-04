import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collection_comments/interfaces/comments_interface.dart';
import 'package:kordi_mobile/collection_comments/models/comment.dart';
import 'package:kordi_mobile/collection_comments/models/comment_dto.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/dio_client.dart';
import 'package:kordi_mobile/core/utils/response_code_converter.dart';
import 'package:kordi_mobile/dependency_injection.dart';

@Singleton(as: CommentsInterface)
class CommentsService implements CommentsInterface {
  @override
  Future<Either<KordiException, Comment>> create(CommentDto dto) async {
    late Either<KordiException, Comment> result;
    final DioClient _dioClient = getIt.get<DioClient>();
    try {
      final response = await _dioClient.dio.post(
        '/collections/${dto.collectionId}/comments',
        data: dto.toJson(),
      );
      result = right(Comment.fromJson(response.data));
    } on DioException catch (e, s) {
      log(
        '[CommentsService] create()',
        error: e,
        stackTrace: s,
      );
      if (e.response?.statusCode == 401) {
        result = left(KordiException.unauthorized());
      } else {
        final String message =
            ResponseCodeConverter.convert(e.response?.data['error']);
        result = left(
          KordiException.customMessage(message: message),
        );
      }
    }
    return result;
  }

  @override
  Future<Either<KordiException, Unit>> delete(
    int collectionId,
    int commentId,
  ) async {
    late Either<KordiException, Unit> result;
    final DioClient _dioClient = getIt.get<DioClient>();
    try {
      await _dioClient.dio
          .delete('/collections/$collectionId/comments/$commentId');
      result = right(unit);
    } on DioException catch (e, s) {
      log(
        '[CommentsService] delete()',
        error: e,
        stackTrace: s,
      );
      if (e.response?.statusCode == 401) {
        result = left(KordiException.unauthorized());
      } else {
        final String message =
            ResponseCodeConverter.convert(e.response?.data['error']);
        result = left(
          KordiException.customMessage(message: message),
        );
      }
    }
    return result;
  }

  @override
  Future<Either<KordiException, List<Comment>>> get(int collectionId) async {
    late Either<KordiException, List<Comment>> result;
    final DioClient _dioClient = getIt.get<DioClient>();
    try {
      final response = await _dioClient.dio.get(
        '/collections/$collectionId/comments',
      );

      final List<Comment> comments = [];
      final List<Map<String, dynamic>> commentsAsMap =
          List<Map<String, dynamic>>.from(response.data['content']);
      for (final comment in commentsAsMap) {
        comments.add(Comment.fromJson(comment));
      }
      result = right(comments);
    } on DioException catch (e, s) {
      log(
        '[CommentsService] get()',
        error: e,
        stackTrace: s,
      );
      if (e.response?.statusCode == 401) {
        result = left(KordiException.unauthorized());
      } else {
        final String message =
            ResponseCodeConverter.convert(e.response?.data['error']);
        result = left(
          KordiException.customMessage(message: message),
        );
      }
    }
    return result;
  }
}
