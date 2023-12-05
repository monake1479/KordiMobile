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
