import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/sign_up/models/verification_type.dart';
import 'package:kordi_mobile/verification_code/controllers/verification_code_controllers.dart';

part 'verification_code_form_event.dart';
part 'verification_code_form_state.dart';
part 'verification_code_form_bloc.freezed.dart';

@injectable
class VerificationCodeFormBloc
    extends Bloc<VerificationCodeFormEvent, VerificationCodeFormState> {
  VerificationCodeFormBloc(
    this._verificationCodeBloc,
  ) : super(VerificationCodeFormState.initial()) {
    on<_UpdateVerificationType>(_updateVerificationType);
    on<_UpdatePhoneNumber>(_updatePhoneNumber);
    on<_UpdateVerificationCode>(_updateVerificationCode);
    on<_UpdateUsername>(_updateUsername);
    on<_ValidateFields>(_validateFields);
    on<_VerifyByEmail>(_verifyByEmail);
    on<_VerifyByPhone>(_verifyByPhone);
    on<_Resend>(_resend);
  }
  final VerificationCodeBloc _verificationCodeBloc;

  void _updateVerificationType(
    _UpdateVerificationType event,
    Emitter<VerificationCodeFormState> emit,
  ) {
    emit(state.copyWith(verificationType: event.verificationType));
  }

  void _updatePhoneNumber(
    _UpdatePhoneNumber event,
    Emitter<VerificationCodeFormState> emit,
  ) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  void _updateVerificationCode(
    _UpdateVerificationCode event,
    Emitter<VerificationCodeFormState> emit,
  ) {
    emit(state.copyWith(verificationCode: event.verificationCode));
  }

  void _updateUsername(
    _UpdateUsername event,
    Emitter<VerificationCodeFormState> emit,
  ) {
    emit(state.copyWith(username: event.username));
  }

  void _validateFields(
    _ValidateFields event,
    Emitter<VerificationCodeFormState> emit,
  ) {
    if (!state.isCodeValid) {
      emit(state.copyWith(verificationCode: ''));
    }
    if (!state.isPhoneNumberValid) {
      emit(state.copyWith(phoneNumber: ''));
    }
    if (!state.isUsernameValid) {
      emit(state.copyWith(username: ''));
    }
  }

  void _verifyByEmail(
    _VerifyByEmail event,
    Emitter<VerificationCodeFormState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    _verificationCodeBloc.add(
      VerificationCodeEvent.verifyByEmail(
        state.verificationCode!,
      ),
    );
    emit(state.copyWith(isLoading: false));
  }

  void _verifyByPhone(
    _VerifyByPhone event,
    Emitter<VerificationCodeFormState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    _verificationCodeBloc.add(
      VerificationCodeEvent.verifyByPhone(
        state.verificationCode!,
        state.phoneNumber!,
      ),
    );
    emit(state.copyWith(isLoading: false));
  }

  void _resend(
    _Resend event,
    Emitter<VerificationCodeFormState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    _verificationCodeBloc.add(
      VerificationCodeEvent.resend(
        state.username!,
      ),
    );
    emit(state.copyWith(isLoading: false));
  }
}
