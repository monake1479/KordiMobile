import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/gen/l10n.dart';

part 'kordi_exception.freezed.dart';

@freezed
class KordiException with _$KordiException {
  const factory KordiException.unauthorized() = Unauthorized;
  const factory KordiException.serverError() = _ServerError;
  const factory KordiException.customMessage({required String message}) =
      _CustomMessage;
}

extension KordiExceptionEx on KordiException {
  String get message {
    return when(
      unauthorized: () => S.current.unauthorizedExceptionMessage,
      serverError: () => S.current.serverExceptionMessage,
      customMessage: (message) => message,
    );
  }
}
