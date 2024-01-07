import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';

part 'package:kordi_mobile/collection_items/controllers/donation_form/donation_form_state.dart';
part 'package:kordi_mobile/collection_items/controllers/donation_form/donation_form_event.dart';
part 'donation_form_bloc.freezed.dart';

@injectable
class DonationFormBloc extends Bloc<DonationFormEvent, DonationFormState> {
  DonationFormBloc() : super(DonationFormState.initial()) {
    on<_SetInitialState>(_setInitialState);
    on<_SetAmount>(_setAmount);
  }
  void _setInitialState(
    _SetInitialState event,
    Emitter<DonationFormState> emit,
  ) {
    emit(
      state.copyWith(
        amount: 0,
        collectionId: event.collectionId,
        collectionItemId: event.collectionItem.id!,
      ),
    );
  }

  void _setAmount(_SetAmount event, Emitter<DonationFormState> emit) {
    if (event.itemCurrentAmount > event.amount) {
      emit(state.copyWith(amount: event.itemCurrentAmount));
      return;
    }

    emit(state.copyWith(amount: event.amount));
  }
}
