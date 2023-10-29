part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthorized() = _Unauthorized;
  const factory AuthState.authorized(
    String username,
    String token,
  ) = Authorized;
  const factory AuthState.exception(KordiException exception) = _Exception;
  const factory AuthState.loading() = _Loading;
}

extension AuthStateEx on AuthState {
  bool get isAuthorized => maybeMap(
        authorized: (_) => true,
        orElse: () => false,
      );

  String get token => maybeMap(
        authorized: (state) => state.token,
        orElse: () => '',
      );
  String get username => maybeMap(
        authorized: (state) => state.username,
        orElse: () => '',
      );
}
