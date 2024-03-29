import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kordi_mobile/collection_addresses/controllers/manage_collection_address/manage_collection_address_cubit.dart';
import 'package:kordi_mobile/collection_addresses/widgets/collection_address_dialog.dart';
import 'package:kordi_mobile/collection_items/controllers/manage_collection_items/manage_collection_items_cubit.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
import 'package:kordi_mobile/collection_items/widgets/collection_item_dialog.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/edit_collection_cubit/edit_collection_cubit.dart';
import 'package:kordi_mobile/collections/controllers/edit_collection_cubit/edit_collection_state.dart';
import 'package:kordi_mobile/collections/controllers/edit_collection_form/edit_collection_form_bloc.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/core/widgets/shake_error.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';
import 'package:kordi_mobile/gen/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

part 'package:kordi_mobile/collections/widgets/collection_edit_description_card.dart';
part 'package:kordi_mobile/collections/widgets/collection_edit_item_list.dart';
part 'package:kordi_mobile/collections/widgets/collection_edit_locations_card.dart';
part 'package:kordi_mobile/collections/widgets/collection_edit_name_card.dart';
part 'package:kordi_mobile/collections/widgets/collection_edit_date_card.dart';

class CollectionEditPage extends StatelessWidget {
  const CollectionEditPage({
    super.key,
    required this.collection,
  });
  final Collection collection;

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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<EditCollectionFormBloc>()
              ..add(
                EditCollectionFormEvent.setInitial(collection.id),
              ),
          ),
          BlocProvider<ManageCollectionAddressCubit>(
            create: (context) => getIt.get<ManageCollectionAddressCubit>()
              ..setAddresses(collection.id),
          ),
          BlocProvider<ManageCollectionItemsCubit>(
            create: (context) => getIt.get<ManageCollectionItemsCubit>()
              ..setItems(collection.id),
          ),
        ],
        child: BlocBuilder<EditCollectionFormBloc, EditCollectionFormState>(
          builder: (context, state) {
            final editCollectionFormBloc =
                context.read<EditCollectionFormBloc>();
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
                        CollectionDetailsPageRoute(collection.id).go(context);
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
                                    editCollectionFormBloc,
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
                    flexibleSpace: FlexibleSpaceBar(
                      background: Builder(
                        builder: (context) {
                          if (state.image == null) {
                            return Assets.images.camera.svg();
                          }
                          return Image.memory(
                            state.image!,
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width * 0.32,
                            height: MediaQuery.of(context).size.height * 0.32,
                          );
                        },
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
                  _CollectionEditDateCard(),
                  _CollectionEditNameCard(collection.title),
                  _CollectionEditDescriptionCard(collection.description),
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
    EditCollectionFormBloc editCollectionFormBloc,
    EditCollectionFormState editCollectionFormState,
    GlobalKey<ShakeErrorState> _shakeErrorKey,
  ) async {
    final editCollectionCubit = context.read<EditCollectionCubit>();
    final manageCollectionItemsCubit =
        context.read<ManageCollectionItemsCubit>();
    final manageCollectionAddressCubit =
        context.read<ManageCollectionAddressCubit>();
    editCollectionFormBloc.add(
      EditCollectionFormEvent.checkValidation(),
    );
    if (!editCollectionFormState.canEditCollection) {
      _shakeErrorKey.currentState?.shake();
      return;
    }
    await editCollectionCubit.edit(editCollectionFormState.toEditCollectionDto);
    if (manageCollectionItemsCubit.itemsChanged) {
      await manageCollectionItemsCubit.save(collection.id);
    }

    if (manageCollectionAddressCubit.addressesChanged) {
      await manageCollectionAddressCubit.save(collection.id);
    }
    if (editCollectionCubit.state.exception == null) {
      context
          .read<CollectionsFilterBloc>()
          .add(CollectionsFilterEvent.getCollections());
      CollectionPageRoute().go(context);
    }
  }
}
