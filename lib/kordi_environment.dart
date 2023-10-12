abstract class KordiEnvironment {
  KordiEnvironment._(this.baseUrl);
  final String baseUrl;
}

class KordiEnvironmentDev implements KordiEnvironment {
  @override
  String get baseUrl => 'http://localhost:8081';
}

class KordiEnvironmentProd implements KordiEnvironment {
  @override
  String get baseUrl => 'http://localhost:8081';
}
