import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/dio_client.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/sign_up/utils/response_code_converter.dart';
import 'package:kordi_mobile/verification_code/interfaces/verification_code_interface.dart';

@Singleton(as: VerificationCodeInterface)
class VerificationCodeService implements VerificationCodeInterface {
  @override
  Future<Either<KordiException, Unit>> resend(String username) async {
    log('[VerificationCodeService] resend()');
    final DioClient dioClient = getIt.get<DioClient>();
    late Either<KordiException, Unit> result;
    try {
      await dioClient.dio.post('/sendToken?username=$username');
      result = right(unit);
    } on DioException catch (e, s) {
      log('[VerificationCodeService] resend() DioException: $e, $s');
      if (e.response?.statusCode == 401) {
        result = left(KordiException.unauthorized());
      } else if (e.response?.statusCode == 400) {
        final String message =
            ResponseCodeConverter.convert(e.response?.data['error']);
        result = left(
          KordiException.customMessage(message: message),
        );
      } else {
        result = left(KordiException.serverError());
      }
    }
    return result;
  }

  @override
  Future<Either<KordiException, Unit>> verifyByEmail(
    String code,
  ) async {
    log('[VerificationCodeService] verifyByEmail()');
    final DioClient dioClient = getIt.get<DioClient>();
    late Either<KordiException, Unit> result;
    try {
      await dioClient.dio.post('/verify?token=$code');
      result = right(unit);
    } on DioException catch (e, s) {
      log('[VerificationCodeService] verifyByEmail() DioException: $e, $s');

      if (e.response?.statusCode == 401) {
        result = left(KordiException.unauthorized());
      } else if (e.response?.statusCode == 400) {
        final String message =
            ResponseCodeConverter.convert(e.response?.data['error']);
        result = left(
          KordiException.customMessage(message: message),
        );
      } else {
        result = left(KordiException.serverError());
      }
    }
    return result;
  }

  @override
  Future<Either<KordiException, Unit>> verifyByPhone(
    String phoneNumber,
    String code,
  ) async {
    log('[VerificationCodeService] verifyByPhone()');
    final DioClient dioClient = getIt.get<DioClient>();
    late Either<KordiException, Unit> result;
    try {
      await dioClient.dio.post('/verify?phone=$phoneNumber&token=$code');
      result = right(unit);
    } on DioException catch (e, s) {
      log('[VerificationCodeService] verifyByPhone() DioException: $e, $s');

      if (e.response?.statusCode == 401) {
        result = left(KordiException.unauthorized());
      } else if (e.response?.statusCode == 400) {
        final String message =
            ResponseCodeConverter.convert(e.response?.data['error']);
        result = left(
          KordiException.customMessage(message: message),
        );
      } else {
        result = left(KordiException.serverError());
      }
    }
    return result;
  }
}
