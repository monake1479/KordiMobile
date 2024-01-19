import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_collection_dto.freezed.dart';
part 'edit_collection_dto.g.dart';

@freezed
class EditCollectionDto with _$EditCollectionDto {
  const factory EditCollectionDto({
    required int id,
    required String title,
    required String description,
    required int userId,
  }) = _EditCollectionDto;
  factory EditCollectionDto.fromJson(Map<String, dynamic> json) =>
      _$EditCollectionDtoFromJson(json);
}
