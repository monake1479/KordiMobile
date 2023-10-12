part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.init() = _Init;
  const factory AuthenticationEvent.login(String username, String password) =
      _Login;
  const factory AuthenticationEvent.reset() = _Reset;
}