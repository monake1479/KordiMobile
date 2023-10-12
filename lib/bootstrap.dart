import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kordi_mobile/app.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/environment_service.dart';
import 'package:kordi_mobile/kordi_environment.dart';

Future<void> bootstrap({
  required KordiEnvironment env,
}) async {
  log('[Bootstrap] baseUrl: ${env.baseUrl}');

  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  configureDependencies();
  getIt.get<EnvironmentService>().environment = env;
  runApp(const KordiApp());
}
