import 'package:dartz/dartz.dart';
import 'package:kordi_mobile/addresses/models/collection_address.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';

abstract class AddressesInterface {
  Future<Either<KordiException, CollectionAddress>> addAddressToCollection({
    required int collectionId,
    required CollectionAddress address,
  });
  Future<Either<KordiException, Unit>> deleteAddressFromCollection({
    required int collectionId,
    required int addressId,
  });
}
