import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collection_items/interfaces/collection_items_interface.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';

part 'package:kordi_mobile/collection_items/controllers/manage_collection_items/manage_collection_items_state.dart';
part 'manage_collection_items_cubit.freezed.dart';

@injectable
class ManageCollectionItemsCubit extends Cubit<ManageCollectionItemsState> {
  ManageCollectionItemsCubit(this._service, this._collectionsFilterBloc)
      : super(ManageCollectionItemsState.initial());
  final CollectionItemsInterface _service;
  final CollectionsFilterBloc _collectionsFilterBloc;

  List<CollectionItem> _initialItems = [];

  bool get itemsChanged {
    final List<CollectionItem> items = List<CollectionItem>.from(state.items);
    return !listEquals(items, _initialItems);
  }

  void reset() {
    emit(ManageCollectionItemsState.initial());
  }

  void setItems(int collectionId) {
    final Collection? collectionById =
        _collectionsFilterBloc.getById(collectionId);
    final List<CollectionItem> items =
        List<CollectionItem>.from(collectionById?.items ?? []);
    _initialItems.addAll(items);
    emit(
      state.copyWith(
        isLoading: false,
        items: items,
      ),
    );
  }

  void addItem(CollectionItem item) {
    final List<CollectionItem> items = List<CollectionItem>.from(state.items);
    items.add(item);
    emit(
      state.copyWith(
        isLoading: false,
        items: items,
      ),
    );
  }

  void editItem(CollectionItem item) {
    final List<CollectionItem> items = List<CollectionItem>.from(state.items);
    final int index = items.indexWhere((element) => element.id == item.id);
    items.removeAt(index);
    items.insert(index, item);
    emit(
      state.copyWith(
        isLoading: false,
        items: items,
      ),
    );
  }

  Future<void> donate(
    DonationDto dto,
    int collectionId,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.donate(
      dto,
      collectionId,
    );
    if (response.isLeft()) {
      emit(
        state.copyWith(
          isLoading: false,
          failureOrSuccessOption: some(left(response.getLeftOrThrow())),
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        isLoading: false,
        failureOrSuccessOption: some(right(response.getRightOrThrow())),
      ),
    );
  }

  Future<void> save(int collectionId) async {
    emit(state.copyWith(isLoading: true));
    final itemsWithoutId =
        state.items.where((element) => element.id == null).toList();
    for (final item in itemsWithoutId) {
      await _create(item, collectionId);
    }

    final itemsWithId =
        state.items.where((element) => element.id != null).toList();
    final List<CollectionItem> itemsChangedWithId = itemsWithId
        .where(
          (element) =>
              element !=
              _initialItems.firstWhere((item) => item.id == element.id),
        )
        .toList();
    for (final item in itemsChangedWithId) {
      await _edit(item, collectionId);
    }
    emit(
      state.copyWith(
        isLoading: false,
        failureOrSuccessOption: some(right(unit)),
      ),
    );
  }

  Future<void> _create(
    CollectionItem item,
    int collectionId,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.create(
      item,
      collectionId,
    );
    if (response.isLeft()) {
      emit(
        state.copyWith(
          isLoading: false,
          failureOrSuccessOption: some(left(response.getLeftOrThrow())),
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        isLoading: false,
        failureOrSuccessOption: some(right(unit)),
      ),
    );
  }

  Future<void> _edit(
    CollectionItem editedItem,
    int collectionId,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.edit(
      editedItem,
      collectionId,
    );
    if (response.isLeft()) {
      emit(
        state.copyWith(
          isLoading: false,
          failureOrSuccessOption: some(left(response.getLeftOrThrow())),
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        isLoading: false,
        failureOrSuccessOption: some(right(unit)),
      ),
    );
  }

  void updateDonation(
    DonationDto dto,
  ) {
    final List<CollectionItem> tempList =
        List<CollectionItem>.from(state.items);
    final int index =
        tempList.indexWhere((element) => element.id == dto.collectionItemId);
    CollectionItem item = tempList.firstWhere(
      (element) => element.id == dto.collectionItemId,
    );

    item = item.copyWith(
      currentAmount: dto.amount + item.currentAmount!,
    );
    tempList.removeWhere(
      (element) => element.id == dto.collectionItemId,
    );
    tempList.insert(index, item);

    emit(
      state.copyWith(
        items: tempList,
      ),
    );
  }
}
