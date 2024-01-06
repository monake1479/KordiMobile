import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';

part 'collection_dto.freezed.dart';
part 'collection_dto.g.dart';

@freezed
class CollectionDto with _$CollectionDto {
  const factory CollectionDto({
    required String title,
    required String description,
    required int userId,
    required List<CollectionAddress> addresses,
    required List<CollectionItem> items,
  }) = _CollectionDto;
  factory CollectionDto.fromJson(Map<String, dynamic> json) =>
      _$CollectionDtoFromJson(json);
}
