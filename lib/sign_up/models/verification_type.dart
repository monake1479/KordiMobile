enum VerificationType {
  email,
  phoneNumber,
}

extension VerificationTypeEx on VerificationType {
  String get value {
    switch (this) {
      case VerificationType.email:
        return 'EMAIL';

      case VerificationType.phoneNumber:
        return 'PHONE';
    }
  }

  String get name {
    switch (this) {
      case VerificationType.email:
        return 'Email';

      case VerificationType.phoneNumber:
        return 'Phone';
    }
  }
}
