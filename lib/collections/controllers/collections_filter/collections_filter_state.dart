part of 'collections_filter_bloc.dart';

@freezed
class CollectionsFilterState with _$CollectionsFilterState {
  const factory CollectionsFilterState({
    required bool isLoading,
    required CollectionPaging collectionPaging,
    required CollectionFilter filter,
  }) = _CollectionsFilterState;
  factory CollectionsFilterState.initial() => CollectionsFilterState(
        isLoading: false,
        collectionPaging: CollectionPaging(
          collections: [],
          totalElements: 0,
          totalPages: 0,
          pageSize: 0,
          pageNumber: 0,
        ),
        filter: CollectionFilter(
          title: null,
          city: null,
          street: null,
          itemName: null,
          categories: null,
          status: null,
          pageNumber: 0,
          pageSize: 10,
          sortBy: null,
        ),
      );
}

extension CollectionsFilterStateEx on CollectionsFilterState {
  int get calculateItemCount {
    if (collectionPaging.pageSize > collections.length) {
      return collections.length;
    } else {
      return collectionPaging.pageSize;
    }
  }

  bool get isReachedMax => collectionPaging.totalElements <= collections.length;

  List<Collection> get collections => collectionPaging.collections;
}
