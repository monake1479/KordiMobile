import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kordi_mobile/auth/interfaces/auth_interface.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/dio_client.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/sign_up/utils/response_code_converter.dart';

class AuthService implements AuthInterface {
  @override
  Future<Either<KordiException, Unit>> login(
    String username,
    String password,
  ) async {
    final DioClient _dioClient = getIt.get<DioClient>();
    late Either<KordiException, Unit> result;
    try {
      await _dioClient.dio.post(
        '/login',
        data: {
          'username': username,
          'password': password,
        },
      );
    } on DioException catch (e, s) {
      log('[AuthService] login() exception: $e', stackTrace: s);
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
