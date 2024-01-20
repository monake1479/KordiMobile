import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/dio_client.dart';
import 'package:kordi_mobile/core/utils/response_code_converter.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/user/interfaces/get_user_interface.dart';
import 'package:kordi_mobile/user/models/user.dart';

@Singleton(as: GetUserInterface)
class GetUserService implements GetUserInterface {
  @override
  Future<Either<KordiException, User>> getUser() async {
    late Either<KordiException, User> result;
    final dioClient = getIt.get<DioClient>();
    try {
      final response = await dioClient.dio.get('/users/me');
      result = right(User.fromJson(response.data));
    } on DioException catch (e, s) {
      log('[GetUserService] getUser() DioException: $e, $s');

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
