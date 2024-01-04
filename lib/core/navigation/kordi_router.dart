import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/change_password/pages/change_password_page.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/pages/collection_details_page.dart';
import 'package:kordi_mobile/collections/pages/collection_edit_page.dart';
import 'package:kordi_mobile/collections/pages/collection_page.dart';
import 'package:kordi_mobile/collections/pages/create_collection_page.dart';
import 'package:kordi_mobile/core/pages/about_page.dart';
import 'package:kordi_mobile/core/pages/error_page.dart';
import 'package:kordi_mobile/core/pages/kordi_scaffold.dart';
import 'package:kordi_mobile/core/transitions/fade_transition_page.dart';
import 'package:kordi_mobile/core/transitions/right_to_left_transition_page.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/l10n.dart';
import 'package:kordi_mobile/sign_in/pages/sign_in_page.dart';
import 'package:kordi_mobile/sign_up/models/verification_type.dart';
import 'package:kordi_mobile/sign_up/pages/sign_up_page.dart';
import 'package:kordi_mobile/verification_code/pages/verification_code_page.dart';

part 'package:kordi_mobile/core/navigation/routes/kordi_scaffold_shell_route.dart';
part 'package:kordi_mobile/core/navigation/routes/verification_route.dart';
part 'package:kordi_mobile/core/navigation/routes/create_collection_shell_route.dart';
part 'package:kordi_mobile/core/navigation/routes/collection_details_route.dart';
part 'package:kordi_mobile/core/navigation/routes/collection_edit_route.dart';
part 'package:kordi_mobile/core/navigation/routes/error_route.dart';

part 'kordi_router.g.dart';

class KordiRouter {
  static GoRouter router(BuildContext context) {
    return GoRouter(
      initialLocation: '/collection',
      debugLogDiagnostics: true,
      routes: $appRoutes,
      errorBuilder: (context, state) => KordiScaffold(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Oops! How did you get here?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: () => CollectionPageRoute().go(context),
              child: Text('To collections'),
            ),
          ],
        ),
      ),
    );
  }
}
