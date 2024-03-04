import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/utils/kordi_environment.dart';

@singleton
class EnvironmentService {
  late KordiEnvironment? _environment;
  KordiEnvironment get environment => _environment!;
  void set environment(KordiEnvironment env) => _environment = env;
}
