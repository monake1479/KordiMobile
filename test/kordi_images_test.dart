import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kordi_mobile/resources/resources.dart';

void main() {
  test('kordi_images assets test', () {
    expect(File(KordiImages.authentication).existsSync(), isTrue);
    expect(File(KordiImages.exception).existsSync(), isTrue);
    expect(File(KordiImages.join).existsSync(), isTrue);
  });
}
