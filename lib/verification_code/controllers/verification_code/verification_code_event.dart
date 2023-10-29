part of 'verification_code_bloc.dart';

@freezed
class VerificationCodeEvent with _$VerificationCodeEvent {
  const factory VerificationCodeEvent.verifyByEmail(String code) =
      _VerifyByEmail;
  const factory VerificationCodeEvent.verifyByPhone(
    String code,
    String phoneNumber,
  ) = _VerifyByPhone;
  const factory VerificationCodeEvent.resend(String username) = _Resend;
}
