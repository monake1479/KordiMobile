import 'package:dartz/dartz.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';

abstract class CollectionItemsInterface {
  Future<Either<KordiException, Unit>> donate(
    DonationDto dto,
    int collectionId,
  );
  Future<Either<KordiException, Unit>> create(
    CollectionItem item,
    int collectionId,
  );
  Future<Either<KordiException, CollectionItem>> edit(
    CollectionItem editedItem,
    int collectionId,
  );
}
