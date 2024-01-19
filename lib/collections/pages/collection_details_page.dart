import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/auth/controllers/auth_cubit.dart';
import 'package:kordi_mobile/collection_addresses/controllers/manage_collection_address/manage_collection_address_cubit.dart';
import 'package:kordi_mobile/collection_comments/controllers/manage_collection_comments/manage_collection_comments_cubit.dart';
import 'package:kordi_mobile/collection_comments/widgets/comment_tile.dart';
import 'package:kordi_mobile/collection_items/controllers/donation_form/donation_form_bloc.dart';
import 'package:kordi_mobile/collection_items/controllers/manage_collection_items/manage_collection_items_cubit.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/edit_collection_form/edit_collection_form_bloc.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/core/utils/color_extension.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/core/widgets/shake_error.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';
import 'package:kordi_mobile/gen/l10n.dart';
import 'package:kordi_mobile/user/controllers/get_user_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

part 'package:kordi_mobile/collection_items/widgets/donation_slider.dart';
part 'package:kordi_mobile/collections/widgets/collection_details_comments.dart';
part 'package:kordi_mobile/collections/widgets/collection_details_description_card.dart';
part 'package:kordi_mobile/collections/widgets/collection_details_item_list.dart';
part 'package:kordi_mobile/collections/widgets/collection_details_locations_card.dart';
part 'package:kordi_mobile/collections/widgets/slide_comment_form.dart';

class CollectionDetailsPage extends StatelessWidget {
  const CollectionDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
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
                    icon: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: colorScheme.onPrimary,
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
                    ),
                    onPressed: () {
                      CollectionPageRoute().go(context);
                    },
                  ),
                  actions: [
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, authState) {
                        if (!authState.isAuthorized && collectionId != userId) {
                          return const SizedBox.shrink();
                        }
                        return IconButton(
                          onPressed: () {
                            CollectionEditPageRoute(collectionId).go(context);
                          },
                          icon: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorScheme.primary,
                            ),
                            child: Icon(
                              Icons.edit_square,
                              color: colorScheme.onPrimary,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Builder(
                        builder: (context) {
                          if (state.image == null) {
                            return Assets.images.camera.svg();
                          }
                          return Image.memory(
                            state.image!,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    centerTitle: true,
                    titlePadding: EdgeInsets.zero,
                    title: Text(
                      state.name,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: (state.image != null)
                            ? colorScheme.onPrimary
                            : colorScheme.onPrimary.textColorBasedOnLuminance,
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
                _CollectionDetailsLocationsTile(),
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
