part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.updateUsername(String username) =
      _UpdateUsername;
  const factory SignInFormEvent.updatePassword(String password) =
      _UpdatePassword;
  const factory SignInFormEvent.validateFields() = _ValidateFields;

  const factory SignInFormEvent.signIn() = _SignIn;
}
