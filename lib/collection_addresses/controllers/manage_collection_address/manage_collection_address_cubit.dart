import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collection_addresses/interfaces/addresses_interface.dart';
import 'package:kordi_mobile/collection_addresses/models/collection_address.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';

part 'package:kordi_mobile/collection_addresses/controllers/manage_collection_address/manage_collection_address_state.dart';
part 'manage_collection_address_cubit.freezed.dart';

@injectable
class ManageCollectionAddressCubit extends Cubit<ManageCollectionAddressState> {
  ManageCollectionAddressCubit(this._service, this._collectionsFilterBloc)
      : super(ManageCollectionAddressState.initial());
  final AddressesInterface _service;
  final CollectionsFilterBloc _collectionsFilterBloc;

  List<CollectionAddress> _initialAddresses = [];

  bool get addressesChanged {
    final List<CollectionAddress> addresses =
        List<CollectionAddress>.from(state.addresses);
    return !listEquals(addresses, _initialAddresses);
  }

  void reset() {
    emit(ManageCollectionAddressState.initial());
  }

  void setAddresses(int collectionId) {
    final List<CollectionAddress> addresses =
        _collectionsFilterBloc.getById(collectionId)?.addresses ?? [];
    _initialAddresses.addAll(addresses);
    emit(
      state.copyWith(
        isLoading: false,
        addresses: addresses,
      ),
    );
  }

  void addAddress(CollectionAddress address) {
    final List<CollectionAddress> addresses =
        List<CollectionAddress>.from(state.addresses);
    addresses.add(address);
    emit(
      state.copyWith(
        isLoading: false,
        addresses: addresses,
      ),
    );
  }

  void removeAddress(CollectionAddress address) {
    final List<CollectionAddress> addresses =
        List<CollectionAddress>.from(state.addresses);
    addresses.remove(address);
    emit(
      state.copyWith(
        isLoading: false,
        addresses: addresses,
      ),
    );
  }

  Future<void> save(int collectionId) async {
    emit(state.copyWith(isLoading: true));
    final addressesWithoutId =
        state.addresses.where((element) => element.id == null).toList();
    for (final address in addressesWithoutId) {
      await _create(address, collectionId);
    }
    final List<CollectionAddress> addressesToDelete =
        List<CollectionAddress>.from(_initialAddresses);
    addressesToDelete
        .removeWhere((element) => state.addresses.contains(element));
    for (final address in addressesToDelete) {
      await _delete(address.id!, collectionId);
    }
    emit(
      state.copyWith(
        isLoading: false,
        failureOrSuccessOption: some(right(unit)),
      ),
    );
  }

  Future<void> _create(
    CollectionAddress address,
    int collectionId,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.create(
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
      return;
    }
    emit(
      state.copyWith(
        isLoading: false,
        failureOrSuccessOption: some(right(unit)),
      ),
    );
  }

  Future<void> _delete(
    int addressId,
    int collectionId,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.delete(
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
