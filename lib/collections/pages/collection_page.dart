import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/get_collections/get_collections_cubit.dart';
import 'package:kordi_mobile/collections/widgets/collection_card.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/l10n/l10n.dart';

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
    _scrollController = ScrollController()..addListener(_onScroll);
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
              itemCount: state.isReachedMax
                  ? state.collections.length
                  : state.collections.length + 1,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Builder(
                  builder: (context) {
                    if (state.collections.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(context.l10n.collectionPageEmptyState),
                        ),
                      );
                    }
                    if (index >= state.collections.length) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      final collection = state.collections[index];
                      return CollectionCard(collection: collection);
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _onScroll() {
    final collectionFilterState = getIt.get<CollectionsFilterBloc>().state;
    if (_isBottom && !collectionFilterState.isLoading) {
      getIt
          .get<CollectionsFilterBloc>()
          .add(CollectionsFilterEvent.getFilteredCollections());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
