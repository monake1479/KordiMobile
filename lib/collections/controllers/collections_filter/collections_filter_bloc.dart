import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
import 'package:kordi_mobile/collections/controllers/get_collections/get_collections_cubit.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/dependency_injection.dart';

part 'collections_filter_state.dart';
part 'collections_filter_event.dart';
part 'collections_filter_bloc.freezed.dart';

@lazySingleton
class CollectionsFilterBloc
    extends Bloc<CollectionsFilterEvent, CollectionsFilterState> {
  CollectionsFilterBloc(this._getCollectionsCubit)
      : super(CollectionsFilterState.initial()) {
    on<_GetCollections>(_getCollections);
    on<_ResetFilter>(_resetFilter);
    on<_UpdateTitle>(_updateTitle);
    on<_UpdateCity>(_updateCity);
    on<_UpdateStreet>(_updateStreet);
    on<_UpdateItemName>(_updateItemName);
    on<_UpdateCategories>(_updateCategories);
    on<_UpdateStatus>(_updateStatus);
    on<_UpdatePageNumber>(_updatePageNumber);
    on<_UpdatePageSize>(_updatePageSize);
    on<_UpdateSortBy>(_updateSortBy);
    on<_UpdateSortDirection>(_updateSortDirection);
    on<_GetFilteredCollections>(_getFilteredCollections);
    on<_GetInitialFilteredCollections>(_getInitialFilteredCollections);
    on<_GetById>(_getById);
    on<_UpdateCollectionItem>(_updateCollectionItem);
  }
  final GetCollectionsCubit _getCollectionsCubit;

  void _resetFilter(
    _ResetFilter event,
    Emitter<CollectionsFilterState> emit,
  ) {
    emit(
      state.copyWith(
        filter: CollectionFilter.initial(),
      ),
    );
  }

  void _updateTitle(
    _UpdateTitle event,
    Emitter<CollectionsFilterState> emit,
  ) {
    emit(
      state.copyWith.filter(title: event.title),
    );
  }

  void _updateCity(
    _UpdateCity event,
    Emitter<CollectionsFilterState> emit,
  ) {
    emit(
      state.copyWith.filter(city: event.city),
    );
  }

  void _updateStreet(
    _UpdateStreet event,
    Emitter<CollectionsFilterState> emit,
  ) {
    emit(
      state.copyWith.filter(street: event.street),
    );
  }

  void _updateItemName(
    _UpdateItemName event,
    Emitter<CollectionsFilterState> emit,
  ) {
    emit(
      state.copyWith.filter(itemName: event.itemName),
    );
  }

  void _updateCategories(
    _UpdateCategories event,
    Emitter<CollectionsFilterState> emit,
  ) {
    if (state.filter.categories != null &&
        state.filter.categories!.contains(event.category)) {
      emit(
        state.copyWith.filter(
          categories: List<CollectionItemCategory>.from(
            state.filter.categories!,
          )..remove(event.category),
        ),
      );
      return;
    }
    emit(
      state.copyWith.filter(
        categories: List<CollectionItemCategory>.from(
          state.filter.categories ?? [],
        )..add(event.category),
      ),
    );
  }

  void _updateStatus(
    _UpdateStatus event,
    Emitter<CollectionsFilterState> emit,
  ) {
    emit(
      state.copyWith.filter(status: event.status),
    );
  }

  void _updatePageNumber(
    _UpdatePageNumber event,
    Emitter<CollectionsFilterState> emit,
  ) {
    emit(
      state.copyWith.filter(pageNumber: event.pageNumber),
    );
  }

  void _updatePageSize(
    _UpdatePageSize event,
    Emitter<CollectionsFilterState> emit,
  ) {
    emit(
      state.copyWith.filter(pageSize: event.pageSize),
    );
  }

  void _updateSortBy(
    _UpdateSortBy event,
    Emitter<CollectionsFilterState> emit,
  ) {
    emit(
      state.copyWith.filter(sortBy: event.sortBy),
    );
  }

  void _updateSortDirection(
    _UpdateSortDirection event,
    Emitter<CollectionsFilterState> emit,
  ) {
    emit(
      state.copyWith.filter(sortDirection: event.sortDirection),
    );
  }

  Future<void> _getInitialFilteredCollections(
    _GetInitialFilteredCollections event,
    Emitter<CollectionsFilterState> emit,
  ) async {
    final initialPageFilter = state.filter.copyWith(pageNumber: 0);
    emit(
      state.copyWith(
        isLoading: true,
        filter: initialPageFilter,
      ),
    );
    final response = await _getCollectionsCubit.getWithFilter(state.filter);
    if (response == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    final CollectionPaging newPaging = CollectionPaging(
      collections: [...response.collections],
      totalElements: response.totalElements,
      totalPages: response.totalPages,
      pageSize: response.pageSize,
      pageNumber: response.pageNumber,
    );

    emit(
      state.copyWith(
        isLoading: false,
        collectionPaging: newPaging,
      ),
    );
  }

  Future<void> _getFilteredCollections(
    _GetFilteredCollections event,
    Emitter<CollectionsFilterState> emit,
  ) async {
    if (state.collectionPaging.totalPages - 1 > state.filter.pageNumber) {
      emit(
        state.copyWith(
          filter:
              state.filter.copyWith(pageNumber: state.filter.pageNumber + 1),
        ),
      );
    }

    emit(state.copyWith(isLoading: true));
    final response = await _getCollectionsCubit.getWithFilter(state.filter);
    if (response == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    final CollectionPaging newPaging = CollectionPaging(
      collections: [...state.collections, ...response.collections],
      totalElements: response.totalElements,
      totalPages: response.totalPages,
      pageSize: response.pageSize,
      pageNumber: response.pageNumber,
    );

    emit(
      state.copyWith(
        isLoading: false,
        collectionPaging: newPaging,
      ),
    );
  }

  Future<void> _getCollections(
    _GetCollections event,
    Emitter<CollectionsFilterState> emit,
  ) async {
    log('[CollectionsFilterBloc] _getCollections()');
    emit(state.copyWith(isLoading: true));

    final response = await _getCollectionsCubit.get();
    if (response == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    emit(
      state.copyWith(
        isLoading: false,
        collectionPaging: response,
      ),
    );
  }

  Future<void> _getById(
    _GetById event,
    Emitter<CollectionsFilterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _getCollectionsCubit.getById(event.id);
    if (response == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }
    final List<Collection> tempList = List<Collection>.from(state.collections);
    final int index = tempList.indexWhere(
      (element) => element.id == event.id,
    );
    tempList.removeWhere(
      (element) => element.id == event.id,
    );
    tempList.insert(index, response);
    final CollectionPaging newPaging = CollectionPaging(
      collections: tempList,
      totalElements: state.collectionPaging.totalElements,
      totalPages: state.collectionPaging.totalPages,
      pageSize: state.collectionPaging.pageSize,
      pageNumber: state.collectionPaging.pageNumber,
    );
    emit(
      state.copyWith(
        isLoading: false,
        collectionPaging: newPaging,
      ),
    );
  }

  Collection? getById(int id) {
    return state.collections.firstWhereOrNull(
      (collection) => collection.id == id,
    );
  }

  void _updateCollectionItem(
    _UpdateCollectionItem event,
    Emitter<CollectionsFilterState> emit,
  ) {
    Collection? collection = state.collections
        .firstWhereOrNull((element) => element.id == event.collectionId);
    if (collection == null) {
      return;
    }
    final int indexOfItemToReplace =
        collection.items.indexWhere((element) => element.id == event.item.id);
    final int collectionIndex = state.collections
        .indexWhere((element) => element.id == event.collectionId);
    final List<CollectionItem> tempItems =
        List<CollectionItem>.from(collection.items);
    tempItems.removeAt(indexOfItemToReplace);
    tempItems.insert(indexOfItemToReplace, event.item);
    collection = collection.copyWith(items: tempItems);
    final List<Collection> tempCollections =
        List<Collection>.from(state.collections);
    tempCollections.removeAt(collectionIndex);
    tempCollections.insert(collectionIndex, collection);
    final CollectionPaging newCollectionPaging = CollectionPaging(
      collections: tempCollections,
      totalElements: state.collectionPaging.totalElements,
      totalPages: state.collectionPaging.totalPages,
      pageSize: state.collectionPaging.pageSize,
      pageNumber: state.collectionPaging.pageNumber,
    );
    emit(state.copyWith(collectionPaging: newCollectionPaging));
  }

  @override
  Future<void> close() async {
    await getIt.resetLazySingleton<CollectionsFilterBloc>();
    return super.close();
  }
}
