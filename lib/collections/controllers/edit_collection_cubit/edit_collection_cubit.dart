import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collections/controllers/edit_collection_cubit/edit_collection_state.dart';
import 'package:kordi_mobile/collections/interfaces/collections_interface.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';

@injectable
class EditCollectionCubit extends Cubit<EditCollectionState> {
  EditCollectionCubit(this._service) : super(EditCollectionState.initial());
  final CollectionsInterface _service;

  void reset() {
    emit(EditCollectionState.initial());
  }

  Future<void> edit(
    EditCollectionDto dto,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _service.patch(dto);
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
