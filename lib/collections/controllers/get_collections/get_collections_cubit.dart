import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collections/interfaces/collections_interface.dart';
import 'package:kordi_mobile/collections/models/collection_filter.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';

part 'get_collections_cubit.freezed.dart';
part 'get_collections_state.dart';

@injectable
class GetCollectionsCubit extends Cubit<GetCollectionsState> {
  GetCollectionsCubit(
    this._service,
  ) : super(GetCollectionsState.initial());
  final CollectionsInterface _service;

  Future<CollectionPaging?> getWithFilter(CollectionFilter filter) async {
    log('[GetCollectionsCubit] getWithFilter()');
    emit(
      state.copyWith(
        isLoading: true,
        failureOrSuccessOption: none(),
      ),
    );
    final response = await _service.getFilteredCollections(filter);
    if (response.isLeft()) {
      emit(
        state.copyWith(
          isLoading: false,
          failureOrSuccessOption: some(left(response.getLeftOrThrow())),
        ),
      );
      return null;
    }

    emit(
      state.copyWith(
        isLoading: false,
        failureOrSuccessOption: some(right(unit)),
      ),
    );
    return response.getRightOrThrow();
  }

  Future<CollectionPaging?> get() async {
    log('[GetCollectionsCubit] get()');
    emit(
      state.copyWith(
        isLoading: true,
        failureOrSuccessOption: none(),
      ),
    );
    final response = await _service.get();
    if (response.isLeft()) {
      emit(
        state.copyWith(
          isLoading: false,
          failureOrSuccessOption: some(left(response.getLeftOrThrow())),
        ),
      );
      return null;
    }

    emit(
      state.copyWith(
        isLoading: false,
        failureOrSuccessOption: some(right(unit)),
      ),
    );
    return response.getRightOrThrow();
  }
}
