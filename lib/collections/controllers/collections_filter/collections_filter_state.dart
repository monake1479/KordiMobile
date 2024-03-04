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
          pageSize: 10,
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
  int calculateItemCount(bool isBottom) {
    if (collections.isEmpty) {
      return 1;
    }
    if (isBottom && collections.length < collectionPaging.totalElements) {
      return collections.length + 1;
    }
    return collections.length;
  }

  bool get isReachedMax => collectionPaging.totalElements <= collections.length;
  bool get canLoadMore =>
      collectionPaging.pageNumber != collectionPaging.totalPages - 1;

  List<Collection> get collections => collectionPaging.collections;

  bool isItemCategorySelected(CollectionItemCategory itemCategory) {
    return filter.categories?.contains(itemCategory) ?? false;
  }
}
