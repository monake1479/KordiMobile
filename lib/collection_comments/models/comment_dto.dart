import 'package:freezed_annotation/freezed_annotation.dart';
part 'comment_dto.freezed.dart';
part 'comment_dto.g.dart';

@freezed
class CommentDto with _$CommentDto {
  const factory CommentDto({
    required String content,
    required int userId,
    required int collectionId,
  }) = _CommentDto;
  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);
}
