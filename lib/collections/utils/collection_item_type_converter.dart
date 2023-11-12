import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collections/models/collection_item_type.dart';

class CollectionItemTypeConverter
    extends JsonConverter<CollectionItemType, String> {
  const CollectionItemTypeConverter();

  @override
  CollectionItemType fromJson(String json) {
    switch (json) {
      case 'WEIGHT':
        return CollectionItemType.weight;
      case 'UNLIMITED':
        return CollectionItemType.unlimited;
      default:
        return CollectionItemType.amount;
    }
  }

  @override
  String toJson(CollectionItemType object) => object.value;
}
