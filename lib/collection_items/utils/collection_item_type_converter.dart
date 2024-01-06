import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';

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
