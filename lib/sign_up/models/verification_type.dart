import 'package:kordi_mobile/gen/l10n.dart';

enum VerificationType {
  email(value: 'EMAIL', name: 'Email'),
  phoneNumber(value: 'PHONE', name: 'Phone');

  const VerificationType({
    required this.name,
    required this.value,
  });
  final String value;
  final String name;
}

extension VerificationTypeEx on VerificationType {
  String get name {
    switch (this) {
      case VerificationType.email:
        return S.current.verificationTypeEmailName;
      case VerificationType.phoneNumber:
        return S.current.verificationTypePhoneName;
    }
  }
}
