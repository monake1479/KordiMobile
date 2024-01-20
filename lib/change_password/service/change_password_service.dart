import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/change_password/interface/change_password_interface.dart';
import 'package:kordi_mobile/change_password/models/change_password_dto.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/dio_client.dart';
import 'package:kordi_mobile/core/utils/response_code_converter.dart';
import 'package:kordi_mobile/dependency_injection.dart';

@Singleton(as: ChangePasswordInterface)
class ChangePasswordService implements ChangePasswordInterface {
  @override
  Future<Either<KordiException, Unit>> changePassword(
    ChangePasswordDto dto,
  ) async {
    final DioClient _dioClient = getIt.get<DioClient>();
    late Either<KordiException, Unit> result;
    try {
      await _dioClient.dio.put(
        '/users/updatePassword?password=${dto.password}&oldPassword=${dto.oldPassword}',
      );
      result = right(unit);
    } on DioException catch (e, s) {
      log('[ChangePasswordService] changePassword() DioException: $e, $s');
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
