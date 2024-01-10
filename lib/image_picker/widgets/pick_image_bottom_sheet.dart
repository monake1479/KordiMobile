import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kordi_mobile/gen/l10n.dart';
import 'package:kordi_mobile/image_picker/controllers/image_picker_cubit.dart';
import 'package:kordi_mobile/image_picker/models/kordi_image_picker_source.dart';

class PickImageBottomSheet extends StatelessWidget {
  const PickImageBottomSheet({
    super.key,
  });

  static Future<XFile?> showImagesPicker(
    BuildContext context, {
    bool shouldCrop = false,
  }) async {
    return showModalBottomSheet<XFile?>(
      context: context,
      useRootNavigator: true,
      builder: (context) => PickImageBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imagePickerCubit = context.read<ImagePickerCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            onTap: () async {
              final image = await imagePickerCubit
                  .pickImage(KordiImagePickerSource.camera);
              Navigator.of(context).pop(image);
            },
            leading: const Icon(Icons.camera_alt),
            title: Text(S.current.pickImageBottomSheetCameraTile),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: ListTile(
            onTap: () async {
              final image = await imagePickerCubit
                  .pickImage(KordiImagePickerSource.gallery);
              Navigator.of(context).pop(image);
            },
            leading: const Icon(Icons.image),
            title: Text(S.current.pickImageBottomSheetGalleryTile),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            onTap: () async {
              final image = await imagePickerCubit
                  .pickImage(KordiImagePickerSource.documents);
              Navigator.of(context).pop(image);
            },
            leading: const Icon(Icons.file_copy_rounded),
            title: Text(S.current.pickImageBottomSheetDocumentsTile),
          ),
        ),
      ],
    );
  }
}
