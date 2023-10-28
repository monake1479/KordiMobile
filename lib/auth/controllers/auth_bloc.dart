import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.unauthorized()) {
    on<_Init>(_init);
    on<_Login>(_login);
    on<_Reset>(_reset);
  }
  Future<void> _init(_Init event, Emitter<AuthState> emitter) async {
    log('[AuthenticationBloc] _init');
  }

  Future<void> _login(
    _Login event,
    Emitter<AuthState> emitter,
  ) async {
    log('[AuthenticationBloc] _login');
  }

  void _reset(_Reset event, Emitter<AuthState> emitter) {
    log('[AuthenticationBloc] _reset');
  }
}
