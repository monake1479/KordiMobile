part of 'change_password_form_bloc.dart';

@freezed
class ChangePasswordFormState with _$ChangePasswordFormState {
  const factory ChangePasswordFormState({
    required bool isLoading,
    required String? password,
    required String? oldPassword,
  }) = _ChangePasswordFormState;
  factory ChangePasswordFormState.initial() => ChangePasswordFormState(
        isLoading: false,
        password: null,
        oldPassword: null,
      );
}

extension ChangePasswordFormStateEx on ChangePasswordFormState {
  bool get showPasswordError => password != null && password!.isEmpty;
  bool get isPasswordValid => password != null && password!.isNotEmpty;
  bool get showOldPasswordError => oldPassword != null && oldPassword!.isEmpty;
  bool get isOldPasswordValid => oldPassword != null && oldPassword!.isNotEmpty;
  bool get isPasswordDifferent => password != oldPassword;
  bool get isFormValid =>
      isPasswordDifferent && isPasswordValid && isOldPasswordValid;
  ChangePasswordDto get toDto => ChangePasswordDto(
        password: password!,
        oldPassword: oldPassword!,
      );
}
