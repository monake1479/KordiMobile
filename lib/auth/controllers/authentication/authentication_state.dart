part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.unauthorized() = _Unauthorized;
  const factory AuthenticationState.authorized(String token) = _Authorized;
  const factory AuthenticationState.exception(KordiException exception) =
      _Exception;
  const factory AuthenticationState.loading() = _Loading;
}

extension AuthenticationStateEx on AuthenticationState {
  String get token => maybeMap(
        authorized: (state) => state.token,
        orElse: () => '',
      );
}
