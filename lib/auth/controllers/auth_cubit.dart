import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/auth/interfaces/auth_interface.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/user/controllers/get_user_cubit.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@LazySingleton()
class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit(this._service, this._getUserCubit)
      : super(AuthState.unauthorized());
  final AuthInterface _service;
  final GetUserCubit _getUserCubit;
  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    log('[AuthCubit] fromJson()');
    final token = json['token'] as String?;
    final username = json['username'] as String?;
    if (token == null || username == null) return null;
    if (token.isEmpty || username.isEmpty) return null;
    return AuthState.authorized(username, token);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    log('[AuthCubit] toJson()');
    return {
      'username': state.username,
      'token': state.token,
    };
  }

  Future<void> init() async {
    log('[AuthCubit] _init');
    if (state is Authorized) {
      final response = await _service.validateToken(
        state.username,
        state.token,
      );
      if (response.isLeft()) {
        emit(AuthState.unauthorized());
        return;
      }
      await _getUserCubit.get();
    }
  }

  void changeAuthState(String username, String token) {
    emit(AuthState.authorized(username, token));
  }

  void signOut() {
    emit(AuthState.unauthorized());
    _getUserCubit.reset();
  }

  @override
  Future<void> close() async {
    await getIt.resetLazySingleton<AuthCubit>();
    return super.close();
  }
}
