import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/utils/base_to_string_converter.dart';
import 'package:kordi_mobile/core/utils/date_time_converter.dart';

part 'collection_dto.freezed.dart';
part 'collection_dto.g.dart';

@freezed
class CollectionDto with _$CollectionDto {
  const factory CollectionDto({
    required String title,
    required String description,
    required int userId,
    @DateTimeConverter() required DateTime? endTime,
    required List<CollectionAddress> addresses,
    required List<CollectionItem> items,
    @BaseToStringConverter() required Uint8List? image,
  }) = _CollectionDto;
  factory CollectionDto.fromJson(Map<String, dynamic> json) =>
      _$CollectionDtoFromJson(json);
}
