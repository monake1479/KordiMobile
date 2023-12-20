import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';

void main() {
  test('kordi_images assets test', () {
    expect(File(Assets.images.authentication.path).existsSync(), isTrue);
    expect(File(Assets.images.changePassword.path).existsSync(), isTrue);
    expect(File(Assets.images.exception.path).existsSync(), isTrue);
    expect(File(Assets.images.join.path).existsSync(), isTrue);
    expect(File(Assets.images.welcoming.path).existsSync(), isTrue);
  });
}
