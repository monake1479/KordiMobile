import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';

void main() {
  test('kordi_avatars assets test', () {
    expect(File(Assets.avatars.femaleAvatar.path).existsSync(), isTrue);
    expect(File(Assets.avatars.maleAvatar.path).existsSync(), isTrue);
  });
}
