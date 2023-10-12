import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/sign_up/models/verification_type.dart';

part 'sign_up_form_bloc.freezed.dart';
part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  SignUpFormBloc() : super(SignUpFormState.initial()) {
    on<_Reset>(_reset);
    on<_UpdateFirstName>(_updateFirstName);
    on<_UpdateLastName>(_updateLastName);
    on<_UpdateUsername>(_updateUsername);
    on<_UpdatePassword>(_updatePassword);
    on<_UpdateEmail>(_updateEmail);
    on<_UpdatePhoneNumber>(_updatePhoneNumber);
    on<_UpdateVerificationType>(_updateVerificationType);
  }
  void _reset(
    SignUpFormEvent event,
    Emitter<SignUpFormState> emit,
  ) {
    emit(SignUpFormState.initial());
  }

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
}
