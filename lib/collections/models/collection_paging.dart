// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';

part 'collection_paging.freezed.dart';
part 'collection_paging.g.dart';

@freezed
class CollectionPaging with _$CollectionPaging {
  const factory CollectionPaging({
    @JsonKey(name: 'content') required List<Collection> collections,
    required int totalElements,
    required int totalPages,
    @JsonKey(name: 'size') required int pageSize,
    @JsonKey(name: 'number') required int pageNumber,
  }) = _CollectionPaging;
  factory CollectionPaging.fromJson(Map<String, dynamic> json) =>
      _$CollectionPagingFromJson(json);
}
