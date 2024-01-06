import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';

part 'collection_item_form_state.dart';
part 'collection_item_form_event.dart';

part 'collection_item_form_bloc.freezed.dart';

@injectable
class CollectionItemFormBloc
    extends Bloc<CollectionItemFormEvent, CollectionItemFormState> {
  CollectionItemFormBloc() : super(CollectionItemFormState.initial()) {
    on<_SetInitial>(_setInitial);
    on<_SetName>(_setName);
    on<_SetType>(_setType);
    on<_SetCategory>(_setCategory);
    on<_SetMaxAmount>(_setMaxAmount);
    on<_SetCurrentAmount>(_setCurrentAmount);
    on<_CheckValidation>(_checkValidation);
  }
  void _setInitial(_SetInitial event, Emitter<CollectionItemFormState> emit) {
    emit(
      state.copyWith(
        id: event.item.id,
        name: event.item.name,
        type: event.item.type,
        category: event.item.category,
        maxAmount: event.item.maxAmount,
        currentAmount: event.item.currentAmount ?? 0,
      ),
    );
  }

  void _setName(_SetName event, Emitter<CollectionItemFormState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _setType(_SetType event, Emitter<CollectionItemFormState> emit) {
    emit(state.copyWith(type: event.type));
  }

  void _setCategory(_SetCategory event, Emitter<CollectionItemFormState> emit) {
    emit(state.copyWith(category: event.category));
  }

  void _setCurrentAmount(
    _SetCurrentAmount event,
    Emitter<CollectionItemFormState> emit,
  ) {
    emit(state.copyWith(currentAmount: event.currentAmount));
  }

  void _setMaxAmount(
    _SetMaxAmount event,
    Emitter<CollectionItemFormState> emit,
  ) {
    emit(state.copyWith(maxAmount: event.maxAmount));
  }

  void _checkValidation(
    _CheckValidation event,
    Emitter<CollectionItemFormState> emit,
  ) {
    if (state.name.isEmpty) {
      emit(
        state.copyWith(
          validationError: true,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        validationError: false,
      ),
    );
  }
}
