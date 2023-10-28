part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthorized() = _Unauthorized;
  const factory AuthState.authorized(String token) = _Authorized;
  const factory AuthState.exception(KordiException exception) = _Exception;
  const factory AuthState.loading() = _Loading;
}

extension AuthStateEx on AuthState {
  String get token => maybeMap(
        authorized: (state) => state.token,
        orElse: () => '',
      );
}
