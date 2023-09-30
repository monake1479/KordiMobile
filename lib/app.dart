import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kordi_mobile/core/utils/custom_scroll_behavior.dart';
import 'package:kordi_mobile/kordi_router.dart';
import 'package:kordi_mobile/theme/color_schemes.dart';

class KordiApp extends StatelessWidget {
  const KordiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: child!,
        );
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: GoogleFonts.barlowTextTheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.barlowTextTheme(),
      ),
      title: 'Kordi Mobile',
      debugShowCheckedModeBanner: false,
      routerConfig: KordiRouter.router(context),
    );
  }
}
