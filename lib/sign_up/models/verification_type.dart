import 'package:kordi_mobile/gen/l10n.dart';

enum VerificationType {
  email(value: 'EMAIL'),
  phoneNumber(value: 'PHONE');

  const VerificationType({
    required this.value,
  });
  final String value;
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
