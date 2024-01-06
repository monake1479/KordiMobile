import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/addresses/interfaces/addresses_interface.dart';
import 'package:kordi_mobile/addresses/models/collection_address.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/dio_client.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/sign_up/utils/response_code_converter.dart';

@Singleton(as: AddressesInterface)
class AddressesService implements AddressesInterface {
  @override
  Future<Either<KordiException, CollectionAddress>> addAddressToCollection({
    required int collectionId,
    required CollectionAddress address,
  }) async {
    log('[AddressesService] addAddressToCollection()');
    late Either<KordiException, CollectionAddress> result;
    final DioClient _dioClient = getIt.get<DioClient>();
    try {
      final response = await _dioClient.dio.post(
        '/collections/$collectionId/addresses',
        data: address.toJson(),
      );

      final CollectionAddress collectionAddress =
          CollectionAddress.fromJson(response.data);
      result = right(collectionAddress);
    } on DioException catch (e, s) {
      log(
        '[AddressesService] addAddressToCollection()',
        error: e,
        stackTrace: s,
      );
      if (e.response?.statusCode == 401) {
        result = left(KordiException.unauthorized());
      } else {
        final String message =
            ResponseCodeConverter.convert(e.response?.data['error']);
        result = left(
          KordiException.customMessage(message: message),
        );
      }
    }
    return result;
  }

  @override
  Future<Either<KordiException, Unit>> deleteAddressFromCollection({
    required int collectionId,
    required int addressId,
  }) async {
    log('[AddressesService] addAddressToCollection()');
    late Either<KordiException, Unit> result;
    final DioClient _dioClient = getIt.get<DioClient>();
    try {
      await _dioClient.dio.post(
        '/collections/$collectionId/addresses/$addressId',
      );

      result = right(unit);
    } on DioException catch (e, s) {
      log(
        '[AddressesService] deleteAddressFromCollection()',
        error: e,
        stackTrace: s,
      );
      if (e.response?.statusCode == 401) {
        result = left(KordiException.unauthorized());
      } else {
        final String message =
            ResponseCodeConverter.convert(e.response?.data['error']);
        result = left(
          KordiException.customMessage(message: message),
        );
      }
    }
    return result;
  }
}
