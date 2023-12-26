import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/collection_form_edit/collection_form_bloc.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/core/utils/kordi_routes.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

part 'package:kordi_mobile/collections/widgets/collection_details_comments.dart';
part 'package:kordi_mobile/collections/widgets/collection_details_description_card.dart';
part 'package:kordi_mobile/collections/widgets/collection_details_item_list.dart';
part 'package:kordi_mobile/collections/widgets/collection_details_locations_card.dart';

class CollectionDetailsPage extends StatelessWidget {
  const CollectionDetailsPage({
    super.key,
    required this.collectionId,
  });
  final int collectionId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocProvider(
      create: (context) => getIt.get<CollectionFormBloc>()
        ..add(
          CollectionFormEvent.setInitialCollection(collectionId),
        ),
      child: BlocBuilder<CollectionFormBloc, CollectionFormState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * 0.14,
                  stretch: true,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: colorScheme.primary,
                          offset: Offset(2, 2),
                        ),
                        Shadow(
                          blurRadius: 5,
                          offset: Offset(3, 2),
                        ),
                      ],
                    ),
                    onPressed: () {
                      CollectionPageRoute().go(context);
                    },
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      'https://picsum.photos/seed/${state.id}/200/300',
                      fit: BoxFit.fill,
                    ),
                    title: Text(
                      state.title,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 5,
                            color: colorScheme.primary,
                            offset: Offset(2, 2),
                          ),
                          Shadow(
                            blurRadius: 5,
                            offset: Offset(3, 2),
                          ),
                        ],
                      ),
                    ),
                    stretchModes: [
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle,
                    ],
                  ),
                ),
                _CollectionDetailsDescriptionCard(
                  description: state.description,
                ),
                _CollectionDetailsLocationsTile(
                  addresses: state.addresses,
                ),
                _CollectionDetailsItemList(
                  items: state.items,
                ),
                _CollectionDetailsComments(),
              ],
            ),
          );
        },
      ),
    );
  }
}
