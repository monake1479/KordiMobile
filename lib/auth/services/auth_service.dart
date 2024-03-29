import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/auth/interfaces/auth_interface.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/dio_client.dart';
import 'package:kordi_mobile/core/utils/response_code_converter.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/l10n.dart';

@Singleton(as: AuthInterface)
class AuthService implements AuthInterface {
  @override
  Future<Either<KordiException, Unit>> validateToken(
    String username,
    String token,
  ) async {
    log('[AuthService] validateToken()');
    final dioClient = getIt.get<DioClient>();
    late Either<KordiException, Unit> result;
    try {
      await dioClient.dio.post('/validate?username=$username&token=$token');
      result = right(unit);
    } on DioException catch (e, s) {
      log(
        '[AuthService] validateToken()',
        error: e.response?.data,
        stackTrace: s,
        name: 'AuthService',
      );
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        result = left(KordiException.unauthorized());
      } else {
        if (e.response == null) {
          result = left(
            KordiException.customMessage(
              message: S.current.authTokenExceptionMessage,
            ),
          );
        }
        if (e.response?.data is String) {
          result =
              left(KordiException.customMessage(message: e.response!.data));
        } else {
          final Map data = Map.from(e.response!.data);
          final String message =
              ResponseCodeConverter.convert(data.entries.first.value);
          result = left(KordiException.customMessage(message: message));
        }
      }
    }
    return result;
  }
}
