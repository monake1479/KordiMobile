part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormEvent with _$SignUpFormEvent {
  const factory SignUpFormEvent.reset() = _Reset;
  const factory SignUpFormEvent.updateFirstName(String firstName) =
      _UpdateFirstName;
  const factory SignUpFormEvent.updateLastName(String lastName) =
      _UpdateLastName;
  const factory SignUpFormEvent.updateUsername(String username) =
      _UpdateUsername;
  const factory SignUpFormEvent.updatePassword(String password) =
      _UpdatePassword;
  const factory SignUpFormEvent.updateEmail(String email) = _UpdateEmail;
  const factory SignUpFormEvent.updatePhoneNumber(String phoneNumber) =
      _UpdatePhoneNumber;
  const factory SignUpFormEvent.updateVerificationType(
    VerificationType verificationType,
  ) = _UpdateVerificationType;
  const factory SignUpFormEvent.validateFields() = _ValidateFields;
  const factory SignUpFormEvent.signUp() = _SignUp;
}
