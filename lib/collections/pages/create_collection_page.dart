import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kordi_mobile/collection_addresses/widgets/collection_address_dialog.dart';
import 'package:kordi_mobile/collection_items/widgets/collection_item_dialog.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/create_collection/create_collection_cubit.dart';
import 'package:kordi_mobile/collections/controllers/create_collection_form/create_collection_form_bloc.dart';
import 'package:kordi_mobile/collections/widgets/create_collection_address_tile.dart';
import 'package:kordi_mobile/collections/widgets/create_collection_item_tile.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/core/utils/kordi_flushbar.dart';
import 'package:kordi_mobile/core/widgets/shake_error.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';
import 'package:kordi_mobile/gen/l10n.dart';
import 'package:kordi_mobile/image_picker/controllers/image_picker_cubit.dart';
import 'package:kordi_mobile/image_picker/models/kordi_image_picker_exception.dart';
import 'package:kordi_mobile/image_picker/widgets/pick_image_bottom_sheet.dart';

part 'package:kordi_mobile/collections/pages/create_collection_first_step.dart';
part 'package:kordi_mobile/collections/pages/create_collection_fourth_step.dart';
part 'package:kordi_mobile/collections/pages/create_collection_second_step.dart';
part 'package:kordi_mobile/collections/pages/create_collection_third_step.dart';

class CreateCollectionPage extends StatelessWidget {
  const CreateCollectionPage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final String? fullPath = GoRouterState.of(context).fullPath;
    return BlocProvider<CreateCollectionFormBloc>(
      create: (context) => getIt.get<CreateCollectionFormBloc>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),
            leading: Builder(
              builder: (context) {
                if (fullPath == '/finish') {
                  return const SizedBox.shrink();
                }
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _createCollectionBackButtonPressed(context);
                  },
                );
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: child,
          ),
        ),
      ),
    );
  }
}

void _createCollectionBackButtonPressed(BuildContext context) {
  final String? fullPath = GoRouterState.of(context).fullPath;

  if (fullPath == null) {
    CollectionPageRoute().go(context);
  }
  switch (fullPath) {
    case '/basic':
      CollectionPageRoute().go(context);
    case '/addresses':
      CreateCollectionFirstStepRoute().go(context);
    case '/items':
      CreateCollectionSecondStepRoute().go(context);
    case '/finish':
      CreateCollectionThirdStepRoute().go(context);
  }
}
