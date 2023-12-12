part of 'collections_filter_bloc.dart';

@freezed
class CollectionsFilterEvent with _$CollectionsFilterEvent {
  const factory CollectionsFilterEvent.resetFilter() = _ResetFilter;
  const factory CollectionsFilterEvent.updateTitle(String title) = _UpdateTitle;
  const factory CollectionsFilterEvent.updateCity(String city) = _UpdateCity;
  const factory CollectionsFilterEvent.updateStreet(String street) =
      _UpdateStreet;
  const factory CollectionsFilterEvent.updateItemName(String itemName) =
      _UpdateItemName;
  const factory CollectionsFilterEvent.updateCategories(
    CollectionItemCategory category,
  ) = _UpdateCategories;
  const factory CollectionsFilterEvent.updateStatus(CollectionStatus status) =
      _UpdateStatus;
  const factory CollectionsFilterEvent.updatePageNumber(int pageNumber) =
      _UpdatePageNumber;
  const factory CollectionsFilterEvent.updatePageSize(int pageSize) =
      _UpdatePageSize;
  const factory CollectionsFilterEvent.updateSortBy(String sortBy) =
      _UpdateSortBy;
  const factory CollectionsFilterEvent.updateSortDirection(
    String sortDirection,
  ) = _UpdateSortDirection;
  const factory CollectionsFilterEvent.getFilteredCollections() =
      _GetFilteredCollections;
  const factory CollectionsFilterEvent.getInitialFilteredCollections() =
      _GetInitialFilteredCollections;
  const factory CollectionsFilterEvent.getCollections() = _GetCollections;
  const factory CollectionsFilterEvent.getById(int id) = _GetById;
}
