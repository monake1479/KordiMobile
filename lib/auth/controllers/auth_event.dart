part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.init() = _Init;
  const factory AuthEvent.login(String username, String password) = _Login;
  const factory AuthEvent.reset() = _Reset;
}
