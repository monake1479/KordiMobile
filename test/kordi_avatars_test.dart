import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kordi_mobile/resources/resources.dart';

void main() {
  test('kordi_avatars assets test', () {
    expect(File(KordiAvatars.femaleAvatar).existsSync(), isTrue);
    expect(File(KordiAvatars.maleAvatar).existsSync(), isTrue);
  });
}
