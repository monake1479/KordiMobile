import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/dio_client.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/donation/interfaces/donation_interface.dart';
import 'package:kordi_mobile/donation/models/donation_dto.dart';
import 'package:kordi_mobile/sign_up/utils/response_code_converter.dart';

@Singleton(as: DonationInterface)
class DonationService implements DonationInterface {
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
        '[DonationService] donate()',
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
