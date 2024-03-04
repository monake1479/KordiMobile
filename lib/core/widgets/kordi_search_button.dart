import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/core/widgets/collections_filter_dialog.dart';

class KordiSearchButton extends StatelessWidget {
  const KordiSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return IconButton(
      icon: Icon(
        Icons.search,
        color: colorScheme.primary,
      ),
      onPressed: () async {
        final actualPath = GoRouterState.of(context).fullPath;
        if (actualPath != CollectionPageRoute().location) {
          CollectionPageRoute().go(context);
        }
        await CollectionsFilterDialog.show(context);
      },
    );
  }
}
