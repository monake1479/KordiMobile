import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/gen/l10n.dart';

part 'kordi_image_picker_exception.freezed.dart';

@freezed
class KordiImagePickerException with _$KordiImagePickerException {
  const factory KordiImagePickerException.canceledByUser() = _CanceledByUser;
  const factory KordiImagePickerException.fileTooBig() = FileTooBig;
  const factory KordiImagePickerException.insufficientPermission() =
      _InsufficientPermission;
}

extension KordiImagePickerExceptionEx on KordiImagePickerException {
  String get message {
    return maybeWhen(
      canceledByUser: () => S.current.imagePickerCanceledByUserException,
      fileTooBig: () => S.current.imagePickerFileTooBigException,
      insufficientPermission: () =>
          S.current.imagePickerInsufficientPermissionException,
      orElse: () => S.current.imagePickerUnexpectedException,
    );
  }
}
