import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collections/models/collection_item_category.dart';

class CollectionItemCategoryConverter
    extends JsonConverter<CollectionItemCategory, String> {
  const CollectionItemCategoryConverter();

  @override
  CollectionItemCategory fromJson(String json) {
    switch (json) {
      case 'FOOD':
        return CollectionItemCategory.food;
      case 'CLOTHES':
        return CollectionItemCategory.clothes;
      case 'ANIMALS':
        return CollectionItemCategory.animals;
      case 'CHILDREN':
        return CollectionItemCategory.children;
      case 'ELECTRONIC':
        return CollectionItemCategory.electronic;
      case 'MEDICINE':
        return CollectionItemCategory.medicines;
      default:
        return CollectionItemCategory.other;
    }
  }

  @override
  String toJson(CollectionItemCategory object) => object.value;
}
