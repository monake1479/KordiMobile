import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';

part 'edit_collection_dto.freezed.dart';
part 'edit_collection_dto.g.dart';

@freezed
class EditCollectionDto with _$EditCollectionDto {
  const factory EditCollectionDto({
    required int id,
    required String title,
    required String description,
    required int userId,
    required List<CollectionAddress> addresses,
  }) = _EditCollectionDto;
  factory EditCollectionDto.fromJson(Map<String, dynamic> json) =>
      _$EditCollectionDtoFromJson(json);
}
