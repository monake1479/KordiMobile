import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kordi_mobile/image_picker/models/kordi_image_picker_exception.dart';
import 'package:kordi_mobile/image_picker/models/kordi_image_picker_source.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

const int kordiImageQuality = 50;
const int availableFileSize = 10485760;
const int availableImageSize = 20971520;

class KordiImagePicker {
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> clearTempFolder() async {
    final Directory tempDirectory = await pathProvider.getTemporaryDirectory();
    final Directory kordiDirectory =
        await Directory('${tempDirectory.path}/kordi').create(recursive: true);

    kordiDirectory.deleteSync(recursive: true);
    unawaited(kordiDirectory.create());
  }

  Future<Either<KordiImagePickerException, XFile>> pickImageFromSource(
    KordiImagePickerSource source,
  ) async {
    late Either<KordiImagePickerException, XFile> result;
    switch (source) {
      case KordiImagePickerSource.camera:
        result = await _pickFromCamera();
        break;
      case KordiImagePickerSource.gallery:
        result = await _pickFromGallery();
        break;
      case KordiImagePickerSource.documents:
        result = await _pickFromDocuments();
        break;
    }
    return result;
  }

  Future<Either<KordiImagePickerException, XFile>> _pickFromCamera() async {
    try {
      final file = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: kordiImageQuality,
      );
      if (file == null) {
        return left(const KordiImagePickerException.canceledByUser());
      }

      return right(
        await _copyAndGetFile(file),
      );
    } catch (e) {
      return left(const KordiImagePickerException.insufficientPermission());
    }
  }

  Future<Either<KordiImagePickerException, XFile>> _pickFromGallery() async {
    try {
      final file = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: kordiImageQuality,
      );
      if (file == null) {
        return left(const KordiImagePickerException.canceledByUser());
      }

      return right(
        await _copyAndGetFile(file),
      );
    } catch (e) {
      return left(const KordiImagePickerException.insufficientPermission());
    }
  }

  Future<Either<KordiImagePickerException, XFile>> _pickFromDocuments() async {
    final response = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (response != null) {
      late XFile copiedFile;
      for (final platformFile in response.files) {
        final Uint8List? bytes = platformFile.bytes;
        final String name = platformFile.name;
        final String? path = platformFile.path;
        final XFile fileFromBytes = XFile(path ?? '', bytes: bytes, name: name);
        copiedFile = await _copyAndGetFile(fileFromBytes);
      }
      return right(
        copiedFile,
      );
    } else {
      return left(const KordiImagePickerException.canceledByUser());
    }
  }

  Future<XFile> _copyAndGetFile(XFile file) async {
    final Directory tempDirectory = await pathProvider.getTemporaryDirectory();
    final Directory kordiDirectory =
        await Directory('${tempDirectory.path}/kordi').create(recursive: true);

    final String fileName = file.path.split('/').last;
    final File fileByPath = File(file.path);
    final File fileCopy =
        await fileByPath.copy('${kordiDirectory.path}/$fileName');
    final Uint8List? bytes = await fileCopy.readAsBytes();
    final String name = fileCopy.path.split('/').last;
    final String path = fileCopy.path;
    final XFile fileFromBytes = XFile(path, bytes: bytes, name: name);
    return fileFromBytes;
  }
}
