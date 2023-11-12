// ignore_for_file: invalid_annotation_target

import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/collections/utils/collection_status_converter.dart';

part 'collection_filter.freezed.dart';
part 'collection_filter.g.dart';

@freezed
class CollectionFilter with _$CollectionFilter {
  const factory CollectionFilter({
    required String? title,
    required String? city,
    required String? street,
    required String? itemName,
    required String? categories,
    @CollectionStatusConverter() required CollectionStatus? status,
    @JsonKey(name: 'pageNo') required int pageNumber,
    required int pageSize,
    required String? sortBy,
    @Default('asc') String sortDirection,
  }) = _CollectionFilter;
  factory CollectionFilter.fromJson(Map<String, dynamic> json) =>
      _$CollectionFilterFromJson(json);
  factory CollectionFilter.initial() => CollectionFilter(
        title: null,
        city: null,
        street: null,
        itemName: null,
        categories: null,
        status: null,
        pageNumber: 0,
        pageSize: 10,
        sortBy: null,
      );
}

extension CollectionFilterEx on CollectionFilter {
  String get toPathParameters {
    final Map<String, dynamic> map = toJson();

    log('[CollectionFilter] BEFORE REMOVE toPathParameters() map: $map');
    map.removeWhere((key, value) => value == null);
    log('[CollectionFilter] AFTER REMOVE toPathParameters() map: $map');
    return map.entries
        .map((e) => '${e.key}=${e.value}')
        .toList()
        .join('&')
        .replaceAll(' ', '%20');
  }
}
