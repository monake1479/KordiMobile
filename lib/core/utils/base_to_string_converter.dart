import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

class BaseToStringConverter implements JsonConverter<Uint8List?, String?> {
  const BaseToStringConverter();

  @override
  Uint8List? fromJson(String? json) {
    if (json == null) return null;
    return base64.decode(json);
  }

  @override
  String? toJson(Uint8List? object) {
    if (object == null) return null;

    return base64Encode(object.toList());
  }
}
