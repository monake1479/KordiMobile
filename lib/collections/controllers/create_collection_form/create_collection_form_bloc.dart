import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/collections/utils/collection_status_converter.dart';
import 'package:kordi_mobile/core/utils/date_time_converter.dart';

part 'package:kordi_mobile/collections/controllers/create_collection_form/create_collection_form_state.dart';
part 'package:kordi_mobile/collections/controllers/create_collection_form/create_collection_form_event.dart';
part 'create_collection_form_bloc.freezed.dart';

@injectable
class CreateCollectionFormBloc
    extends Bloc<CreateCollectionFormEvent, CreateCollectionFormState> {
  CreateCollectionFormBloc() : super(CreateCollectionFormState.initial()) {
    on<_Reset>(_reset);
    on<_SetName>(_setName);
    on<_SetDescription>(_setDescription);
    on<_SetEndDate>(_setEndDate);
    on<_SetImage>(_setImage);
    on<_AddAddress>(_addAddress);
    on<_RemoveAddress>(_removeAddress);
    on<_AddItem>(_addItem);
    on<_RemoveItem>(_removeItem);
    on<_CheckValidation>(_checkValidation);
  }
  void _reset(_Reset event, Emitter<CreateCollectionFormState> emit) {
    emit(CreateCollectionFormState.initial());
  }

  void _setName(
    _SetName event,
    Emitter<CreateCollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
        name: event.name,
      ),
    );
  }

  void _setDescription(
    _SetDescription event,
    Emitter<CreateCollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
        description: event.description,
      ),
    );
  }

  void _setEndDate(
    _SetEndDate event,
    Emitter<CreateCollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
        endTime: event.endDate,
      ),
    );
  }

  void _setImage(
    _SetImage event,
    Emitter<CreateCollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
        image: event.image,
      ),
    );
  }

  void _addAddress(
    _AddAddress event,
    Emitter<CreateCollectionFormState> emit,
  ) {
    final List<CollectionAddress> tempList = List.from(state.addresses);
    tempList.add(event.address);
    emit(
      state.copyWith(
        addresses: tempList,
      ),
    );
  }

  void _removeAddress(
    _RemoveAddress event,
    Emitter<CreateCollectionFormState> emit,
  ) {
    final List<CollectionAddress> tempList = List.from(state.addresses);
    tempList.remove(event.address);

    emit(
      state.copyWith(
        addresses: tempList,
      ),
    );
  }

  void _addItem(
    _AddItem event,
    Emitter<CreateCollectionFormState> emit,
  ) {
    final List<CollectionItem> tempList = List.from(state.items);
    tempList.add(event.item);
    emit(
      state.copyWith(
        items: tempList,
      ),
    );
  }

  void _removeItem(
    _RemoveItem event,
    Emitter<CreateCollectionFormState> emit,
  ) {
    final List<CollectionItem> tempList = List.from(state.items);
    tempList.remove(event.item);
    emit(
      state.copyWith(
        items: tempList,
      ),
    );
  }

  void _checkValidation(
    _CheckValidation event,
    Emitter<CreateCollectionFormState> emit,
  ) {
    if (state.name.isEmpty ||
        state.description.isEmpty ||
        state.addresses.isEmpty ||
        state.items.isEmpty) {
      emit(state.copyWith(validationError: true));
      return;
    }
    emit(state.copyWith(validationError: false));
  }
}
