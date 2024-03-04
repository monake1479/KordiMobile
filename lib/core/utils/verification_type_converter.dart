import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/sign_up/models/verification_type.dart';

class VerificationTypeConverter
    extends JsonConverter<VerificationType, String> {
  const VerificationTypeConverter();

  @override
  VerificationType fromJson(String json) {
    switch (json) {
      case 'EMAIL':
        return VerificationType.email;
      case 'PHONE':
        return VerificationType.phoneNumber;
      default:
        throw Exception('Unknown verification type: $json');
    }
  }

  @override
  String toJson(VerificationType object) => object.toString().split('.').last;
}
