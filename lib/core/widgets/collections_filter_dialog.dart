import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/l10n.dart';

class CollectionsFilterDialog extends StatefulWidget {
  const CollectionsFilterDialog({super.key});

  static Future<void> show(BuildContext context) async {
    await showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog.adaptive(
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        content: CollectionsFilterDialog(),
        title: Text(
          S.current.filterDialogTitle,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(S.current.filterDialogCloseButtonLabel),
          ),
          TextButton(
            onPressed: () {
              getIt
                  .get<CollectionsFilterBloc>()
                  .add(CollectionsFilterEvent.updatePageNumber(0));
              getIt
                  .get<CollectionsFilterBloc>()
                  .add(CollectionsFilterEvent.getInitialFilteredCollections());
              context.pop();
            },
            child: Text(S.current.filterDialogApplyButtonLabel),
          ),
        ],
      ),
    );
  }

  @override
  State<CollectionsFilterDialog> createState() =>
      _CollectionsFilterDialogState();
}

class _CollectionsFilterDialogState extends State<CollectionsFilterDialog> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final collectionsFilterBloc = getIt.get<CollectionsFilterBloc>();
    return Scaffold(
      body: BlocBuilder<CollectionsFilterBloc, CollectionsFilterState>(
        bloc: collectionsFilterBloc,
        builder: (context, state) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  initialValue: state.filter.title,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    border: OutlineInputBorder(),
                    labelText: S.current.filterDialogTitleLabelText,
                  ),
                  onChanged: (title) {
                    collectionsFilterBloc.add(
                      CollectionsFilterEvent.updateTitle(title),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  initialValue: state.filter.city,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    border: OutlineInputBorder(),
                    labelText: S.current.filterDialogCityLabelText,
                  ),
                  onChanged: (city) {
                    collectionsFilterBloc.add(
                      CollectionsFilterEvent.updateCity(city),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  initialValue: state.filter.street,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    border: OutlineInputBorder(),
                    labelText: S.current.filterDialogStreetLabelText,
                  ),
                  onChanged: (street) {
                    collectionsFilterBloc.add(
                      CollectionsFilterEvent.updateStreet(street),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  initialValue: state.filter.itemName,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    border: OutlineInputBorder(),
                    labelText: S.current.filterDialogItemNameLabelText,
                  ),
                  onChanged: (itemName) {
                    collectionsFilterBloc.add(
                      CollectionsFilterEvent.updateItemName(itemName),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  S.current.filterDialogCategoryTitle,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: RawScrollbar(
                  controller: _scrollController,
                  thumbColor: colorScheme.primary,
                  thumbVisibility: true,
                  child: ListView(
                    controller: _scrollController,
                    children: CollectionItemCategory.values
                        .map(
                          (itemCategory) => Row(
                            children: [
                              Checkbox(
                                value:
                                    state.isItemCategorySelected(itemCategory),
                                onChanged: (value) {
                                  collectionsFilterBloc.add(
                                    CollectionsFilterEvent.updateCategories(
                                      itemCategory,
                                    ),
                                  );
                                },
                              ),
                              Text(itemCategory.name),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
