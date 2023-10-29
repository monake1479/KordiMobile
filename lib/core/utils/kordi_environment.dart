import 'dart:io';

abstract class KordiEnvironment {
  KordiEnvironment._(this.baseUrl);
  final String baseUrl;
}

class KordiEnvironmentDev implements KordiEnvironment {
  @override
  String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8081';
    } else {
      return 'http://192.168.8.199:8081';
    }
  }
}

class KordiEnvironmentProd implements KordiEnvironment {
  @override
  String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8081';
    } else {
      return 'http://192.168.8.199:8081';
    }
  }
}
