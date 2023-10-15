import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/sign_up/controllers/sign_up/sign_up_bloc.dart';
import 'package:kordi_mobile/sign_up/models/sign_up_dto.dart';
import 'package:kordi_mobile/sign_up/models/verification_type.dart';

part 'sign_up_form_bloc.freezed.dart';
part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  SignUpFormBloc(this._signUpBloc) : super(SignUpFormState.initial()) {
    on<_UpdateFirstName>(_updateFirstName);
    on<_UpdateLastName>(_updateLastName);
    on<_UpdateUsername>(_updateUsername);
    on<_UpdatePassword>(_updatePassword);
    on<_UpdateEmail>(_updateEmail);
    on<_UpdatePhoneNumber>(_updatePhoneNumber);
    on<_UpdateVerificationType>(_updateVerificationType);
    on<_ValidateFields>(_validateFields);
    on<_SignUp>(_signUp);
    on<_Reset>(_reset);
  }
  final SignUpBloc _signUpBloc;

  void _updateFirstName(
    _UpdateFirstName event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(firstName: event.firstName));
  }

  void _updateLastName(
    _UpdateLastName event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(lastName: event.lastName));
  }

  void _updateUsername(
    _UpdateUsername event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(username: event.username));
  }

  void _updatePassword(
    _UpdatePassword event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _updateEmail(
    _UpdateEmail event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _updatePhoneNumber(
    _UpdatePhoneNumber event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  void _updateVerificationType(
    _UpdateVerificationType event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(verificationType: event.verificationType));
  }

  void _validateFields(
    _ValidateFields event,
    Emitter<SignUpFormState> emit,
  ) {
    if (!state.isUsernameValid) {
      emit(state.copyWith(username: ''));
    }
    if (!state.isFirstNameValid) {
      emit(state.copyWith(firstName: ''));
    }
    if (!state.isLastNameValid) {
      emit(state.copyWith(lastName: ''));
    }
    if (!state.isPasswordValid) {
      emit(state.copyWith(password: ''));
    }
    if (!state.isEmailValid) {
      emit(state.copyWith(email: ''));
    }
    if (!state.isPhoneNumberValid) {
      emit(state.copyWith(phoneNumber: ''));
    }

    ;
  }

  void _signUp(
    _SignUp event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    final SignUpDto dto = state.dto;
    _signUpBloc.add(SignUpEvent.signUp(dto));
    emit(state.copyWith(isLoading: false));
  }

  void _reset(
    SignUpFormEvent event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(SignUpFormState.initial());
  }
}
