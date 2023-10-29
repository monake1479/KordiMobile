import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/dio_client.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/sign_up/interfaces/sign_up_interface.dart';
import 'package:kordi_mobile/sign_up/models/sign_up_dto.dart';
import 'package:kordi_mobile/sign_up/utils/response_code_converter.dart';

@Singleton(as: SignUpInterface)
class SignUpService implements SignUpInterface {
  @override
  Future<Either<KordiException, Unit>> signUp(SignUpDto dto) async {
    late Either<KordiException, Unit> result;
    final dioClient = getIt.get<DioClient>();
    try {
      await dioClient.dio.post('/register', data: dto.toJson());
      result = right(unit);
    } on DioException catch (e, s) {
      log('[SignUpService] signUp() exception: $e', stackTrace: s);
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
