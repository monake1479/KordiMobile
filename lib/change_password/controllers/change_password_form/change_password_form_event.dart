part of 'change_password_form_bloc.dart';

@freezed
class ChangePasswordFormEvent with _$ChangePasswordFormEvent {
  const factory ChangePasswordFormEvent.updatePassword(String password) =
      _UpdatePassword;
  const factory ChangePasswordFormEvent.updateOldPassword(String oldPassword) =
      _UpdateOldPassword;
  const factory ChangePasswordFormEvent.validateFields() = _ValidateFields;

  const factory ChangePasswordFormEvent.changePassword() = _ChangePassword;
  const factory ChangePasswordFormEvent.reset() = _Reset;
}
