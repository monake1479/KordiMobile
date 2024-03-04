import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';
import 'package:kordi_mobile/image_picker/kordi_image_picker.dart';
import 'package:kordi_mobile/image_picker/models/kordi_image_picker_exception.dart';
import 'package:kordi_mobile/image_picker/models/kordi_image_picker_source.dart';

part 'package:kordi_mobile/image_picker/controllers/image_picker_state.dart';
part 'image_picker_cubit.freezed.dart';

@Injectable()
class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerState.initial());

  final KordiImagePicker _kordiImagePicker = KordiImagePicker();

  Future<XFile?> pickImage(KordiImagePickerSource source) async {
    emit(state.copyWith(isLoading: true));
    final response = await _kordiImagePicker.pickImageFromSource(
      source,
    );
    if (response.isLeft()) {
      emit(
        state.copyWith(
          isLoading: false,
          failureOrSuccessOption: some(left(response.getLeftOrThrow())),
        ),
      );
      return null;
    }
    emit(
      state.copyWith(
        isLoading: false,
        failureOrSuccessOption: some(right(response.getRightOrThrow())),
      ),
    );
    return response.getRightOrThrow();
  }

  void deleteImage() {
    emit(ImagePickerState.initial());
  }
}
