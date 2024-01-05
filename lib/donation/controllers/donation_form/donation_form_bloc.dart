import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/donation/models/donation_dto.dart';

part 'package:kordi_mobile/donation/controllers/donation_form/donation_form_state.dart';
part 'package:kordi_mobile/donation/controllers/donation_form/donation_form_event.dart';
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
        amount: event.collectionItem.currentAmount ?? 0,
        collectionId: event.collectionId,
        collectionItemId: event.collectionItem.id!,
      ),
    );
  }

  void _setAmount(_SetAmount event, Emitter<DonationFormState> emit) {
    log('[DonationFormBloc] _setAmount( amount:${event.amount}, itemCurrentAmount:${event.itemCurrentAmount})');

    if (event.itemCurrentAmount > event.amount) {
      emit(state.copyWith(amount: event.itemCurrentAmount));
      return;
    }
    // if (event.itemCurrentAmount > 0 && event.amount > event.itemCurrentAmount) {
    //   emit(state.copyWith(amount: event.amount - event.itemCurrentAmount));
    //   return;
    // }

    emit(state.copyWith(amount: event.amount));
  }
}
