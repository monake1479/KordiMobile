import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/addresses/interfaces/addresses_interface.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';

part 'package:kordi_mobile/addresses/controllers/manage_collection_address/manage_collection_address_state.dart';
part 'manage_collection_address_cubit.freezed.dart';

@injectable
class ManageCollectionAddressCubit extends Cubit<ManageCollectionAddressState> {
  ManageCollectionAddressCubit(this._service)
      : super(ManageCollectionAddressState.initial());
  final AddressesInterface _service;

  void reset() {
    emit(ManageCollectionAddressState.initial());
  }

  Future<CollectionAddress?> addAddressToCollection(
    CollectionAddress address,
    int collectionId,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.addAddressToCollection(
      collectionId: collectionId,
      address: address,
    );
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

  Future<void> deleteAddressFromCollection(
    int addressId,
    int collectionId,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.deleteAddressFromCollection(
      collectionId: collectionId,
      addressId: addressId,
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
}
