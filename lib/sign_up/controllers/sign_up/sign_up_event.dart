part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.reset() = _Reset;
  const factory SignUpEvent.signUp(SignUpDto dto) = _SignUp;
}
