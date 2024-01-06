import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/auth/controllers/auth_cubit.dart';
import 'package:kordi_mobile/collection_items/controllers/donation_form/donation_form_bloc.dart';
import 'package:kordi_mobile/collection_items/controllers/manage_collection_items/manage_collection_items_cubit.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/edit_collection_form/edit_collection_form_bloc.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/l10n.dart';
import 'package:kordi_mobile/user/controllers/get_user_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

part 'package:kordi_mobile/collection_items/widgets/donation_slider.dart';
part 'package:kordi_mobile/collections/widgets/collection_details_comments.dart';
part 'package:kordi_mobile/collections/widgets/collection_details_description_card.dart';
part 'package:kordi_mobile/collections/widgets/collection_details_item_list.dart';
part 'package:kordi_mobile/collections/widgets/collection_details_locations_card.dart';

class CollectionDetailsPage extends StatelessWidget {
  const CollectionDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authState = context.read<AuthCubit>().state;
    final userId = context.read<GetUserCubit>().state.user?.id;
    final collectionIdString =
        GoRouterState.of(context).pathParameters['collectionId'];
    if (collectionIdString == null) {
      KordiDialog.showException(
        context,
        KordiException.customMessage(
          message: 'Something went wrong with navigation.',
        ),
      );
      CollectionPageRoute().go(context);
    }
    final collectionId = int.parse(collectionIdString!);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<EditCollectionFormBloc>()
            ..add(
              EditCollectionFormEvent.setInitial(collectionId),
            ),
        ),
        BlocProvider<ManageCollectionItemsCubit>(
          create: (context) =>
              getIt.get<ManageCollectionItemsCubit>()..setItems(collectionId),
        ),
      ],
      child: BlocBuilder<EditCollectionFormBloc, EditCollectionFormState>(
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
                  actions: [
                    Builder(
                      builder: (context) {
                        if (!authState.isAuthorized && collectionId != userId) {
                          return const SizedBox.shrink();
                        }
                        return IconButton(
                          onPressed: () {
                            CollectionEditPageRoute(collectionId).go(context);
                          },
                          icon: Icon(
                            Icons.edit_square,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      'https://picsum.photos/seed/${state.id}/200/300',
                      fit: BoxFit.fill,
                    ),
                    title: Text(
                      state.name,
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
                _CollectionDetailsItemList(),
                _CollectionDetailsComments(),
              ],
            ),
          );
        },
      ),
    );
  }
}
