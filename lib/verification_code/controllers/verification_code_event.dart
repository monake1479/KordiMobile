part of 'verification_code_bloc.dart';

@freezed
class VerificationCodeEvent with _$VerificationCodeEvent {
  const factory VerificationCodeEvent.verify(String code, String username) =
      _Verify;
  const factory VerificationCodeEvent.resend(String username) = _Resend;
}
