import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
import 'package:kordi_mobile/collection_items/utils/collection_item_utils.dart';

part 'collection_item.freezed.dart';
part 'collection_item.g.dart';

@freezed
class CollectionItem with _$CollectionItem {
  const factory CollectionItem({
    required int? id,
    required String name,
    @CollectionItemTypeConverter() required CollectionItemType type,
    @CollectionItemCategoryConverter() required CollectionItemCategory category,
    @Default(0) int? currentAmount,
    required int maxAmount,
  }) = _CollectionItem;
  factory CollectionItem.fromJson(Map<String, dynamic> json) =>
      _$CollectionItemFromJson(json);
}

extension CollectionItemEx on CollectionItem {
  String get currentAmountWithUnit => '${currentAmount ?? 0}${type.unitSuffix}';
  String get maxAmountWithUnit => '$maxAmount${type.unitSuffix}';
  bool get isFinished => currentAmount == maxAmount;
}
