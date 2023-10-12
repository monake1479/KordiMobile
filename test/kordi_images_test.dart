import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kordi_mobile/resources/resources.dart';

void main() {
  test('kordi_images assets test', () {
    expect(File(KordiImages.join).existsSync(), isTrue);
  });
}
