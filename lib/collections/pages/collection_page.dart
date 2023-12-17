import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/get_collections/get_collections_cubit.dart';
import 'package:kordi_mobile/collections/widgets/collection_card.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/gen/l10n.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({
    super.key,
  });

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        log('[CollectionPage] refresh collections');
        context
            .read<CollectionsFilterBloc>()
            .add(CollectionsFilterEvent.resetFilter());
        context
            .read<CollectionsFilterBloc>()
            .add(CollectionsFilterEvent.getCollections());
      },
      child: BlocListener<GetCollectionsCubit, GetCollectionsState>(
        listener: (context, state) {
          if (state.exception != null) {
            KordiDialog.showException(
              context,
              state.exception!,
            );
          }
        },
        child: BlocBuilder<CollectionsFilterBloc, CollectionsFilterState>(
          builder: (context, state) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.calculateItemCount(_isBottom),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (state.collections.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              S.current.collectionPageEmptyState,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<CollectionsFilterBloc>()
                                  .add(CollectionsFilterEvent.getCollections());
                            },
                            child: Text(
                              S.current.collectionPageEmptyStateButtonLabel,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (index >= state.collections.length) {
                  if (state.isLoading) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state.canLoadMore) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<CollectionsFilterBloc>().add(
                                CollectionsFilterEvent.getFilteredCollections(),
                              );
                        },
                        child: Text(
                          S.current.collectionPageLoadMoreButtonLabel,
                        ),
                      ),
                    );
                  }
                }

                final collection = state.collections[index];
                return CollectionCard(collection: collection);
              },
            );
          },
        ),
      ),
    );
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    if (_scrollController.position.hasContentDimensions) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      return currentScroll >= (maxScroll * 0.9);
    }
    return false;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
