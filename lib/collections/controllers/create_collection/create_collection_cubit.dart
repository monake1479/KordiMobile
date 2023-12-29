import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collections/interfaces/collections_interface.dart';
import 'package:kordi_mobile/collections/models/collection_dto.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';

part 'create_collection_state.dart';
part 'create_collection_cubit.freezed.dart';

@injectable
class CreateCollectionCubit extends Cubit<CreateCollectionState> {
  CreateCollectionCubit(this._service) : super(CreateCollectionState.initial());

  final CollectionsInterface _service;

  void reset() {
    emit(CreateCollectionState.initial());
  }

  Future<void> create(CollectionDto dto) async {
    emit(state.copyWith(isLoading: true));
    final result = await _service.create(dto);
    if (result.isLeft()) {
      emit(
        state.copyWith(
          isLoading: false,
          failureOrSuccessOption: some(left(result.getLeftOrThrow())),
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
}
