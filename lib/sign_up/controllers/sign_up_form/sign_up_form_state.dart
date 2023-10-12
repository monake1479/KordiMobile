part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    required bool isLoading,
    required String firstName,
    required String lastName,
    required String username,
    required String password,
    required String email,
    required String phoneNumber,
    required VerificationType verificationType,
  }) = _SignUpFormState;
  factory SignUpFormState.initial() => SignUpFormState(
        isLoading: false,
        firstName: '',
        lastName: '',
        username: '',
        password: '',
        email: '',
        phoneNumber: '',
        verificationType: VerificationType.email,
      );
}
