part of 'package:kordi_mobile/image_picker/controllers/image_picker_cubit.dart';

@freezed
class ImagePickerState with _$ImagePickerState {
  const factory ImagePickerState({
    required bool isLoading,
    required Option<Either<KordiImagePickerException, XFile>>
        failureOrSuccessOption,
  }) = _ImagePickerState;
  factory ImagePickerState.initial() => ImagePickerState(
        isLoading: false,
        failureOrSuccessOption: none(),
      );
}

extension ImagePickerStateEx on ImagePickerState {
  KordiImagePickerException? get exception => failureOrSuccessOption.fold(
        () => null,
        (either) => either.fold(
          (exception) => exception,
          (_) => null,
        ),
      );
  XFile? get image => failureOrSuccessOption.fold(
        () => null,
        (either) => either.fold(
          (_) => null,
          (image) => image,
        ),
      );
}
