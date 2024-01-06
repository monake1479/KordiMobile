import 'package:dartz/dartz.dart';
import 'package:kordi_mobile/collection_addresses/models/collection_address.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';

abstract class AddressesInterface {
  Future<Either<KordiException, Unit>> create({
    required int collectionId,
    required CollectionAddress address,
  });
  Future<Either<KordiException, Unit>> delete({
    required int collectionId,
    required int addressId,
  });
}
