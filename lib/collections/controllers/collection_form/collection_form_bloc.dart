import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/models/collection_dto.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/collections/utils/collection_status_converter.dart';
import 'package:kordi_mobile/core/utils/date_time_converter.dart';

part 'collection_form_event.dart';
part 'collection_form_state.dart';

part 'collection_form_bloc.freezed.dart';

@Injectable()
class CollectionFormBloc
    extends Bloc<CollectionFormEvent, CollectionFormState> {
  CollectionFormBloc(
    this._collectionsFilterBloc,
  ) : super(CollectionFormState.initial()) {
    on<_Reset>(_reset);
    on<_SetInitial>(_setInitialCollection);
    on<_SetUserId>(_setUserId);
    on<_SetName>(_setName);
    on<_SetDescription>(_setDescription);
    on<_SetEndDate>(_setEndDate);
    on<_SetPhoto>(_setPhoto);
    on<_SetAddresses>(_setAddresses);
    on<_AddAddress>(_addAddress);
    on<_RemoveAddress>(_removeAddress);
    on<_SetItems>(_setItems);
    on<_AddItem>(_addItem);
    on<_RemoveItem>(_removeItem);
    on<_CheckValidation>(_checkValidation);
  }
  final CollectionsFilterBloc _collectionsFilterBloc;
  void _reset(_Reset event, Emitter<CollectionFormState> emit) {
    emit(CollectionFormState.initial());
  }

  void _setInitialCollection(
    _SetInitial event,
    Emitter<CollectionFormState> emit,
  ) {
    final Collection? collection = _collectionsFilterBloc.getById(event.id);
    if (collection == null) {
      return;
    }
    emit(
      state.copyWith(
        id: collection.id,
        name: collection.title,
        description: collection.description,
        startTime: collection.startTime,
        endTime: collection.endTime,
        completedTime: collection.completedTime,
        // image: collection.image,
        status: collection.status,
        userId: collection.userId,
        addresses: collection.addresses,
        items: collection.items,
        comments: collection.comments,
      ),
    );
  }

  void _setUserId(
    _SetUserId event,
    Emitter<CollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
        userId: event.userId,
      ),
    );
  }

  void _setName(
    _SetName event,
    Emitter<CollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
        name: event.name,
      ),
    );
  }

  void _setDescription(
    _SetDescription event,
    Emitter<CollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
        description: event.description,
      ),
    );
  }

  void _setEndDate(
    _SetEndDate event,
    Emitter<CollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
        endTime: event.endDate,
      ),
    );
  }

  void _setPhoto(
    _SetPhoto event,
    Emitter<CollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
          // image: event.photo,
          ),
    );
  }

  void _setAddresses(
    _SetAddresses event,
    Emitter<CollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
        addresses: event.addresses,
      ),
    );
  }

  void _addAddress(
    _AddAddress event,
    Emitter<CollectionFormState> emit,
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
    Emitter<CollectionFormState> emit,
  ) {
    final List<CollectionAddress> tempList = List.from(state.addresses);
    tempList.remove(event.address);

    emit(
      state.copyWith(
        addresses: tempList,
      ),
    );
  }

  void _setItems(
    _SetItems event,
    Emitter<CollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
        items: event.items,
      ),
    );
  }

  void _addItem(
    _AddItem event,
    Emitter<CollectionFormState> emit,
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
    Emitter<CollectionFormState> emit,
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
    Emitter<CollectionFormState> emit,
  ) {
    if (state.name.isEmpty || state.description.isEmpty) {
      emit(state.copyWith(validationError: true));
      return;
    }
    emit(state.copyWith(validationError: false));
  }
}
