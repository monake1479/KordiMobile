import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/collection_form/collection_form_bloc.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/edit_collection_cubit/edit_collection_cubit.dart';
import 'package:kordi_mobile/collections/controllers/edit_collection_cubit/edit_collection_state.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/collections/widgets/collection_address_dialog.dart';
import 'package:kordi_mobile/collections/widgets/collection_item_dialog.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/core/widgets/shake_error.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

part 'package:kordi_mobile/collections/widgets/collection_edit_description_card.dart';
part 'package:kordi_mobile/collections/widgets/collection_edit_name_card.dart';
part 'package:kordi_mobile/collections/widgets/collection_edit_locations_card.dart';
part 'package:kordi_mobile/collections/widgets/collection_edit_item_list.dart';

class CollectionEditPage extends StatelessWidget {
  const CollectionEditPage({
    super.key,
    required this.collectionId,
  });
  final int collectionId;

  @override
  Widget build(BuildContext context) {
    final _shakeErrorKey = GlobalKey<ShakeErrorState>();
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocProvider(
        create: (context) => getIt.get<CollectionFormBloc>()
          ..add(
            CollectionFormEvent.setInitial(collectionId),
          ),
        child: BlocBuilder<CollectionFormBloc, CollectionFormState>(
          builder: (context, state) {
            final collectionFormBloc = context.read<CollectionFormBloc>();
            if (state.isLoading) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
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
                        CollectionDetailsPageRoute(collectionId).go(context);
                      },
                    ),
                    actions: [
                      BlocProvider(
                        create: (context) => getIt.get<EditCollectionCubit>(),
                        child: BlocConsumer<EditCollectionCubit,
                            EditCollectionState>(
                          listener: (context, editCollectionState) async {
                            if (editCollectionState.exception != null) {
                              await KordiDialog.showException(
                                context,
                                editCollectionState.exception!,
                              );
                            }
                          },
                          builder: (context, createCollectionState) {
                            return ShakeError(
                              key: _shakeErrorKey,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await _onAddItemButtonOnPressed(
                                    context,
                                    collectionFormBloc,
                                    state,
                                    _shakeErrorKey,
                                  );
                                },
                                child: Text(
                                  S.current.collectionEditSaveButtonLabel,
                                  style: textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                    flexibleSpace: InkWell(
                      onTap: () {
                        log('Change image state.name: ${state.name}');
                      },
                      child: FlexibleSpaceBar(
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
                  ),
                  _CollectionEditNameCard(),
                  _CollectionEditDescriptionCard(),
                  _CollectionEditLocationsTile(),
                  _CollectionEditItemList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _onAddItemButtonOnPressed(
    BuildContext context,
    CollectionFormBloc collectionFormBloc,
    CollectionFormState state,
    GlobalKey<ShakeErrorState> _shakeErrorKey,
  ) async {
    final editCollectionCubit = context.read<EditCollectionCubit>();
    collectionFormBloc.add(
      CollectionFormEvent.checkValidation(),
    );
    if (!state.canSaveCollection) {
      _shakeErrorKey.currentState?.shake();
      return;
    }
    await editCollectionCubit.edit(state.toEditCollectionDto);
    if (editCollectionCubit.state.exception == null) {
      context
          .read<CollectionsFilterBloc>()
          .add(CollectionsFilterEvent.getCollections());
      CollectionPageRoute().go(context);
    }
  }
}
