import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';

void main() {
  test('kordi_icons assets test', () {
    expect(File(Assets.icons.logo.path).existsSync(), isTrue);
  });
}
