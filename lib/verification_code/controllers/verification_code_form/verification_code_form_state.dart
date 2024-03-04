part of 'verification_code_form_bloc.dart';

@freezed
class VerificationCodeFormState with _$VerificationCodeFormState {
  const factory VerificationCodeFormState({
    required bool isLoading,
    required String? phoneNumber,
    required String? verificationCode,
    required String? username,
    required VerificationType verificationType,
  }) = _VerificationCodeFormState;

  factory VerificationCodeFormState.initial() => VerificationCodeFormState(
        isLoading: false,
        phoneNumber: null,
        verificationCode: null,
        username: null,
        verificationType: VerificationType.email,
      );
}

extension VerificationCodeFormStateX on VerificationCodeFormState {
  bool get showUsernameError => username != null && username!.isEmpty;
  bool get isUsernameValid => username != null && username!.isNotEmpty;
  bool get showPhoneNumberError => phoneNumber != null && phoneNumber!.isEmpty;
  bool get isPhoneNumberValid =>
      phoneNumber != null &&
      phoneNumber!.isNotEmpty &&
      phoneNumber!.length == 9;
  bool get showCodeError =>
      verificationCode != null && verificationCode!.isEmpty;
  bool get isCodeValid =>
      verificationCode != null &&
      verificationCode!.isNotEmpty &&
      verificationCode!.length == 6;
  bool get isFormValid {
    if (verificationType == VerificationType.email) {
      return isCodeValid;
    } else {
      return isCodeValid && isPhoneNumberValid && isUsernameValid;
    }
  }
}
