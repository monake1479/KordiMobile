part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required bool isLoading,
    required String? username,
    required String? password,
  }) = _SignInFormState;
  factory SignInFormState.initial() => SignInFormState(
        isLoading: false,
        username: null,
        password: null,
      );
}

extension SignInFormStateX on SignInFormState {
  SignInDto get dto => SignInDto(
        username: username!,
        password: password!,
      );
  bool get isUsernameValid => username != null && username!.isNotEmpty;
  bool get showUsernameError => username != null && username!.isEmpty;
  bool get isPasswordValid => password != null && password!.isNotEmpty;
  bool get showPasswordError => password != null && password!.isEmpty;
  bool get isFormValid => isUsernameValid && isPasswordValid;
}
