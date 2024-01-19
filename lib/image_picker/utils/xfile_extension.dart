import 'package:image_picker/image_picker.dart';

extension XFileEx on XFile {
  Future<bool> get isFileTooBig async => await this.length() > 20971520;
}
