import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kordi_mobile/auth/controllers/auth_cubit.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/get_collections/get_collections_cubit.dart';
import 'package:kordi_mobile/core/services/environment_service.dart';
import 'package:kordi_mobile/core/utils/kordi_environment.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/kordi_app.dart';
import 'package:kordi_mobile/user/controllers/get_user_cubit.dart';
import 'package:path_provider/path_provider.dart';

Future<void> bootstrap({
  required KordiEnvironment env,
}) async {
  log('[Bootstrap] baseUrl: ${env.baseUrl}');
  configureDependencies();
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  getIt.get<EnvironmentService>().environment = env;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GetUserCubit>(
          create: (context) => getIt.get<GetUserCubit>(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => getIt.get<AuthCubit>()..init(),
        ),
        BlocProvider<GetCollectionsCubit>(
          create: (context) => getIt.get<GetCollectionsCubit>(),
        ),
        BlocProvider<CollectionsFilterBloc>(
          create: (context) => getIt.get<CollectionsFilterBloc>()
            ..add(CollectionsFilterEvent.getCollections()),
        ),
      ],
      child: KordiApp(),
    ),
  );
}
