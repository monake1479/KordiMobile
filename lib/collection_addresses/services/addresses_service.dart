import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collection_addresses/interfaces/addresses_interface.dart';
import 'package:kordi_mobile/collection_addresses/models/collection_address.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/dio_client.dart';
import 'package:kordi_mobile/core/utils/response_code_converter.dart';
import 'package:kordi_mobile/dependency_injection.dart';

@Singleton(as: AddressesInterface)
class AddressesService implements AddressesInterface {
  @override
  Future<Either<KordiException, Unit>> create({
    required int collectionId,
    required CollectionAddress address,
  }) async {
    log('[AddressesService] create()');
    late Either<KordiException, Unit> result;
    final DioClient _dioClient = getIt.get<DioClient>();
    try {
      await _dioClient.dio.post(
        '/collections/$collectionId/addresses',
        data: address.toJson(),
      );

      result = right(unit);
    } on DioException catch (e, s) {
      log(
        '[AddressesService] create()',
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
  Future<Either<KordiException, Unit>> delete({
    required int collectionId,
    required int addressId,
  }) async {
    log('[AddressesService] delete()');
    late Either<KordiException, Unit> result;
    final DioClient _dioClient = getIt.get<DioClient>();
    try {
      await _dioClient.dio.delete(
        '/collections/$collectionId/addresses/$addressId',
      );

      result = right(unit);
    } on DioException catch (e, s) {
      log(
        '[AddressesService] delete()',
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
