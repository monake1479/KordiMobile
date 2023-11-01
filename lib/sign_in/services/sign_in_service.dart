import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/dio_client.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/sign_in/interface/sign_in_interface.dart';
import 'package:kordi_mobile/sign_in/models/sign_in_dto.dart';
import 'package:kordi_mobile/sign_up/utils/response_code_converter.dart';

@Singleton(as: SignInInterface)
class SignInService implements SignInInterface {
  @override
  Future<Either<KordiException, String>> signIn(SignInDto dto) async {
    late Either<KordiException, String> result;
    final dioClient = getIt.get<DioClient>();
    try {
      final response = await dioClient.dio.post(
        '/login',
        data: dto.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
      );
      result = right(response.data['access_token']);
    } on DioException catch (e, s) {
      log('[SignInService] signIn() exception: $e', stackTrace: s);

      final String message =
          ResponseCodeConverter.convert(e.response?.data['error']);
      result = left(
        KordiException.customMessage(message: message),
      );
    }
    return result;
  }
}
