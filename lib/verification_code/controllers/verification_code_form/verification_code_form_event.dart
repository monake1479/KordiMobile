part of 'verification_code_form_bloc.dart';

@freezed
class VerificationCodeFormEvent with _$VerificationCodeFormEvent {
  const factory VerificationCodeFormEvent.updatePhoneNumber(
    String phoneNumber,
  ) = _UpdatePhoneNumber;
  const factory VerificationCodeFormEvent.updateVerificationCode(
    String verificationCode,
  ) = _UpdateVerificationCode;
  const factory VerificationCodeFormEvent.updateUsername(String username) =
      _UpdateUsername;
  const factory VerificationCodeFormEvent.validateFields() = _ValidateFields;
  const factory VerificationCodeFormEvent.verifyByEmail() = _VerifyByEmail;
  const factory VerificationCodeFormEvent.verifyByPhone() = _VerifyByPhone;
  const factory VerificationCodeFormEvent.resend() = _Resend;
}
