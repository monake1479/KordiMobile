import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/change_password/controllers/change_password/change_password_bloc.dart';
import 'package:kordi_mobile/change_password/models/change_password_dto.dart';

part 'change_password_form_event.dart';
part 'change_password_form_state.dart';
part 'change_password_form_bloc.freezed.dart';

@injectable
class ChangePasswordFormBloc
    extends Bloc<ChangePasswordFormEvent, ChangePasswordFormState> {
  ChangePasswordFormBloc(this._changePasswordBloc)
      : super(ChangePasswordFormState.initial()) {
    on<_UpdatePassword>(_updatePassword);
    on<_UpdateOldPassword>(_updateOldPassword);
    on<_ValidateFields>(_validateFields);
    on<_ChangePassword>(_changePassword);
    on<_Reset>(_reset);
  }
  final ChangePasswordBloc _changePasswordBloc;
  void _updatePassword(
    _UpdatePassword event,
    Emitter<ChangePasswordFormState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _updateOldPassword(
    _UpdateOldPassword event,
    Emitter<ChangePasswordFormState> emit,
  ) {
    emit(state.copyWith(oldPassword: event.oldPassword));
  }

  void _validateFields(
    _ValidateFields event,
    Emitter<ChangePasswordFormState> emit,
  ) {
    if (!state.isPasswordValid) {
      emit(state.copyWith(password: ''));
    }
    if (!state.isOldPasswordValid) {
      emit(state.copyWith(oldPassword: ''));
    }
  }

  void _changePassword(
    _ChangePassword event,
    Emitter<ChangePasswordFormState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    _changePasswordBloc.add(ChangePasswordEvent.changePassword(state.toDto));
    emit(state.copyWith(isLoading: false));
  }

  void _reset(
    _Reset event,
    Emitter<ChangePasswordFormState> emit,
  ) {
    emit(ChangePasswordFormState.initial());
  }
}
