// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/collections/utils/collection_item_category_converter.dart';
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
    @CollectionItemCategoryConverter()
    required List<CollectionItemCategory>? categories,
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

    map.removeWhere((key, value) => value == null);
    return map.entries
        .map((filter) {
          if (filter.value is List<String>) {
            final StringBuffer options = StringBuffer();
            for (int i = 0; i < filter.value.length; i++) {
              if (i == 0) {
                options.write(filter.value[i]);
              } else {
                options.write(',');
                options.write(filter.value[i]);
              }
            }
            return '${filter.key}=$options';
          }
          return '${filter.key}=${filter.value}';
        })
        .toList()
        .join('&')
        .replaceAll(' ', '%20');
  }
}
