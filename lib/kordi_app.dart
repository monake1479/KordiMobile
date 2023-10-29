import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kordi_mobile/core/controllers/localization_bloc.dart';
import 'package:kordi_mobile/core/utils/custom_scroll_behavior.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/core/utils/kordi_router.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/theme/color_schemes.dart';
import 'package:kordi_mobile/user/controllers/get_user_cubit.dart';

class KordiApp extends StatelessWidget {
  const KordiApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return BlocProvider<LocalizationBloc>(
      create: (context) => getIt.get<LocalizationBloc>(),
      child: BlocBuilder<LocalizationBloc, Locale>(
        builder: (context, state) {
          return BlocListener<GetUserCubit, GetUserState>(
            listener: (context, state) async {
              if (state.exception != null) {
                await KordiDialog.showException(
                  context,
                  state.exception!,
                );
              }
            },
            child: MaterialApp.router(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: state,
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
            ),
          );
        },
      ),
    );
  }
}
