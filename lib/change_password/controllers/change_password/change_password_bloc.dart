import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/change_password/interface/change_password_interface.dart';
import 'package:kordi_mobile/change_password/models/change_password_dto.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';
import 'package:kordi_mobile/dependency_injection.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';
part 'change_password_bloc.freezed.dart';

@lazySingleton
class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc(this._service) : super(ChangePasswordState.initial()) {
    on<_ChangePassword>(_changePassword);
  }
  final ChangePasswordInterface _service;
  Future<void> _changePassword(
    _ChangePassword event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final response = await _service.changePassword(event.dto);
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

  @override
  Future<void> close() async {
    await getIt.resetLazySingleton<ChangePasswordBloc>();
    return super.close();
  }
}
