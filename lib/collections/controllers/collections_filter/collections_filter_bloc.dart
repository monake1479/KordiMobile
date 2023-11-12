import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collections/controllers/get_collections/get_collections_cubit.dart';
import 'package:kordi_mobile/collections/models/collection_filter.dart';
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
    emit(
      state.copyWith.filter(categories: event.categories),
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

  Future<void> _getFilteredCollections(
    _GetFilteredCollections event,
    Emitter<CollectionsFilterState> emit,
  ) async {
    log('[CollectionsFilterBloc] _getFilteredCollections()');

    if (state.collectionPaging.totalPages - 1 == state.filter.pageNumber) {
      return;
    }

    emit(state.copyWith.filter(pageNumber: state.filter.pageNumber + 1));

    emit(state.copyWith(isLoading: true));
    final response = await _getCollectionsCubit.getWithFilter(state.filter);
    if (response == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    final CollectionPaging newPaging = CollectionPaging(
      collections: [
        ...state.collectionPaging.collections,
        ...response.collections,
      ],
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

  @override
  Future<void> close() async {
    await getIt.resetLazySingleton<CollectionsFilterBloc>();
    return super.close();
  }
}
