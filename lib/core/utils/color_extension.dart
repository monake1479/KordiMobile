import 'package:flutter/material.dart';

extension ColorEx on Color {
  Color get textColorBasedOnLuminance {
    return this.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}
