import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kordi_mobile/app.dart';
import 'package:kordi_mobile/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  configureDependencies();
  runApp(const KordiApp());
}
