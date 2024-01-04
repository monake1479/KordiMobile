import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';

part 'collection_address_form_event.dart';
part 'collection_address_form_state.dart';

part 'collection_address_form_bloc.freezed.dart';

@injectable
class CollectionAddressFormBloc
    extends Bloc<CollectionAddressFormEvent, CollectionAddressFormState> {
  CollectionAddressFormBloc() : super(CollectionAddressFormState.initial()) {
    on<_SetInitial>(_setInitial);
    on<_SetCity>(_setCity);
    on<_SetStreet>(_setStreet);
    on<_CheckValidation>(_checkValidation);
  }
  void _setInitial(
    _SetInitial event,
    Emitter<CollectionAddressFormState> emit,
  ) {
    emit(
      state.copyWith(
        city: event.address.city,
        street: event.address.street,
      ),
    );
  }

  void _setCity(
    _SetCity event,
    Emitter<CollectionAddressFormState> emit,
  ) {
    emit(state.copyWith(city: event.city));
  }

  void _setStreet(
    _SetStreet event,
    Emitter<CollectionAddressFormState> emit,
  ) {
    emit(state.copyWith(street: event.street));
  }

  void _checkValidation(
    _CheckValidation event,
    Emitter<CollectionAddressFormState> emit,
  ) {
    emit(state.copyWith(validationError: !state.isFormValid));
  }
}
