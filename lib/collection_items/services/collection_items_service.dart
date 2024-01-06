import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collection_items/interfaces/collection_items_interface.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/dio_client.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/sign_up/utils/response_code_converter.dart';

@Singleton(as: CollectionItemsInterface)
class CollectionItemsService implements CollectionItemsInterface {
  @override
  Future<Either<KordiException, Unit>> donate(
    DonationDto dto,
    int collectionId,
  ) async {
    late Either<KordiException, Unit> result;
    final DioClient _dioClient = getIt.get<DioClient>();

    try {
      await _dioClient.dio.post(
        '/collections/$collectionId/items/submit',
        data: [dto.toJson()],
      );
      result = right(unit);
    } on DioException catch (e, s) {
      log(
        '[CollectionItemsService] donate()',
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
  Future<Either<KordiException, Unit>> create(
    CollectionItem item,
    int collectionId,
  ) async {
    late Either<KordiException, Unit> result;
    final DioClient _dioClient = getIt.get<DioClient>();
    try {
      await _dioClient.dio.post(
        '/collections/$collectionId',
        data: item.toJson(),
      );
      result = right(unit);
    } on DioException catch (e, s) {
      log(
        '[CollectionItemsService] create()',
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
  Future<Either<KordiException, CollectionItem>> edit(
    CollectionItem item,
    int collectionId,
  ) async {
    late Either<KordiException, CollectionItem> result;
    final DioClient _dioClient = getIt.get<DioClient>();
    try {
      final response = await _dioClient.dio.patch(
        '/collections/$collectionId/items/${item.id}',
        data: item.toJson(),
      );
      result = right(CollectionItem.fromJson(response.data));
    } on DioException catch (e, s) {
      log(
        '[CollectionItemsService] edit()',
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
