import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';
import 'package:kordi_mobile/donation/interfaces/donation_interface.dart';
import 'package:kordi_mobile/donation/models/donation_dto.dart';

part 'package:kordi_mobile/donation/controllers/donation/donation_state.dart';
part 'donation_cubit.freezed.dart';

@injectable
class DonationCubit extends Cubit<DonationState> {
  DonationCubit(this._service) : super(DonationState.initial());
  final DonationInterface _service;

  void reset() {
    emit(DonationState.initial());
  }

  Future<void> donate(
    DonationDto dto,
    int collectionId,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.donate(
      dto,
      collectionId,
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
        failureOrSuccessOption: some(right(response.getRightOrThrow())),
      ),
    );
  }
}
