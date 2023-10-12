import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

@singleton
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState.unauthorized()) {
    on<_Init>(_init);
    on<_Login>(_login);
    on<_Reset>(_reset);
  }
  Future<void> _init(_Init event, Emitter<AuthenticationState> emitter) async {
    log('[AuthenticationBloc] _init');
  }

  Future<void> _login(
    _Login event,
    Emitter<AuthenticationState> emitter,
  ) async {
    log('[AuthenticationBloc] _login');
  }

  void _reset(_Reset event, Emitter<AuthenticationState> emitter) {
    log('[AuthenticationBloc] _reset');
  }
}
