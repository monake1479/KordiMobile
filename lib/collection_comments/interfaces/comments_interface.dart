import 'package:dartz/dartz.dart';
import 'package:kordi_mobile/collection_comments/models/comment.dart';
import 'package:kordi_mobile/collection_comments/models/comment_dto.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';

abstract class CommentsInterface {
  Future<Either<KordiException, List<Comment>>> get(int collectionId);
  Future<Either<KordiException, Comment>> create(CommentDto dto);
  Future<Either<KordiException, Unit>> delete(int collectionId, int commentId);
}
