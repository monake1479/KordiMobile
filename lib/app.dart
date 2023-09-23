import 'package:flutter/material.dart';
import 'package:kordi_mobile/core/custom_scroll_behavior.dart';
import 'package:kordi_mobile/kordi_router.dart';

class KordiApp extends StatelessWidget {
  const KordiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: child!,
        );
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      title: 'Kordi Mobile',
      debugShowCheckedModeBanner: false,
      routeInformationProvider:
          KordiRouter.router(context).routeInformationProvider,
      routeInformationParser:
          KordiRouter.router(context).routeInformationParser,
      routerDelegate: KordiRouter.router(context).routerDelegate,
    );
  }
}
