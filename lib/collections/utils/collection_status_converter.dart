import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collections/models/collection_status.dart';

class CollectionStatusConverter
    extends JsonConverter<CollectionStatus, String> {
  const CollectionStatusConverter();

  @override
  CollectionStatus fromJson(String json) {
    switch (json) {
      case 'IN_PROGRESS':
        return CollectionStatus.inProgress;
      case 'COMPLETED':
        return CollectionStatus.completed;
      default:
        return CollectionStatus.archived;
    }
  }

  @override
  String toJson(CollectionStatus object) => object.value;
}
