part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    required bool isLoading,
    required String? firstName,
    required String? lastName,
    required String? username,
    required String? password,
    required String? email,
    required String? phoneNumber,
    required VerificationType verificationType,
    required KordiException? exception,
  }) = _SignUpFormState;
  factory SignUpFormState.initial() => SignUpFormState(
        isLoading: false,
        firstName: null,
        lastName: null,
        username: null,
        password: null,
        email: null,
        phoneNumber: null,
        verificationType: VerificationType.email,
        exception: null,
      );
}

extension SignUpFormStateEx on SignUpFormState {
  bool get isFirstNameValid => firstName != null && firstName!.isNotEmpty;
  bool get showFirstNameError => firstName != null && firstName!.isEmpty;
  bool get isLastNameValid => lastName != null && lastName!.isNotEmpty;
  bool get showLastNameError => lastName != null && lastName!.isEmpty;
  bool get isUsernameValid => username != null && username!.isNotEmpty;
  bool get showUsernameError => username != null && username!.isEmpty;
  bool get isPasswordValid => password != null && password!.isNotEmpty;
  bool get showPasswordError => password != null && password!.isEmpty;
  bool get isEmailValid => email != null && email!.isNotEmpty;
  bool get showEmailError => email != null && email!.isEmpty;
  bool get isPhoneNumberValid => phoneNumber != null && phoneNumber!.isNotEmpty;
  bool get showPhoneNumberError =>
      phoneNumber != null && (phoneNumber!.isEmpty || phoneNumber!.length < 9);
  bool get isFormValid =>
      isFirstNameValid &&
      isLastNameValid &&
      isUsernameValid &&
      isPasswordValid &&
      isEmailValid &&
      isPhoneNumberValid;
  SignUpDto get dto => SignUpDto(
        firstName: firstName ?? '',
        lastName: lastName ?? '',
        username: username ?? '',
        password: password ?? '',
        email: email ?? '',
        phoneNumber: phoneNumber ?? '',
        verificationType: verificationType.value,
      );
}
