import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/auth/controllers/authentication/authentication_bloc.dart';
import 'package:kordi_mobile/core/services/environment_service.dart';

@lazySingleton
class DioClient {
  DioClient(
    this._authenticationBloc,
    this._environmentService,
  ) {
    _dio.options = BaseOptions(
      baseUrl: _environmentService.environment.baseUrl,
      sendTimeout: Duration(seconds: 10),
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log(
            '[DioClient] REQUEST[${options.method}] => PATH: ${options.path}',
          );
          if (_authenticationBloc.state.token.isNotEmpty) {
            options.headers['Authorization'] =
                'Bearer ${_authenticationBloc.state.token}';
          } else {
            options.headers['Authorization'] = '';
          }
          return handler.next(options);
        },
      ),
    );
  }
  final EnvironmentService _environmentService;
  final AuthenticationBloc _authenticationBloc;
  Dio _dio = Dio();

  Dio get dio => _dio;
}
