import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:kordi_mobile/core/utils/date_time_converter.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required int id,
    required String content,
    @DateTimeConverter() required DateTime createdTime,
    required String? username,
  }) = _Comment;
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

extension CommentX on Comment {
  String get createdTimeFormatted {
    final DateFormat formatter = DateFormat('dd.MM.yyyy HH:mm');
    return formatter.format(createdTime);
  }

  bool isOwner(String username) {
    return username == username;
  }
}
