import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/core/utils/date_time_converter.dart';
import 'package:kordi_mobile/user/models/user.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String content,
    @DateTimeConverter() required DateTime createdTime,
    required User user,
    required int userId,
    required int collectionId,
  }) = _Comment;
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
