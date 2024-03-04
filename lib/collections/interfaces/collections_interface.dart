import 'package:dartz/dartz.dart';

import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';

abstract class CollectionsInterface {
  Future<Either<KordiException, CollectionPaging>> getFilteredCollections(
    CollectionFilter dto,
  );
  Future<Either<KordiException, CollectionPaging>> get();
  Future<Either<KordiException, Collection>> getById(int id);
  Future<Either<KordiException, Collection>> create(CollectionDto dto);
  Future<Either<KordiException, Collection>> patch(EditCollectionDto dto);
}
