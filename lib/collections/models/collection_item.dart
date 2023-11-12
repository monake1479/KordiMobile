import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/collections/utils/collection_item_category_converter.dart';
import 'package:kordi_mobile/collections/utils/collection_item_type_converter.dart';

part 'collection_item.freezed.dart';
part 'collection_item.g.dart';

@freezed
class CollectionItem with _$CollectionItem {
  const factory CollectionItem({
    required String name,
    @CollectionItemTypeConverter() required CollectionItemType type,
    @CollectionItemCategoryConverter() required CollectionItemCategory category,
    required int currentAmount,
    required int maxAmount,
  }) = _CollectionItem;
  factory CollectionItem.fromJson(Map<String, dynamic> json) =>
      _$CollectionItemFromJson(json);
}
