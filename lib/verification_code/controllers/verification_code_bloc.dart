import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';
import 'package:kordi_mobile/verification_code/interfaces/verification_code_interface.dart';

part 'verification_code_state.dart';
part 'verification_code_event.dart';
part 'verification_code_bloc.freezed.dart';

@Singleton()
class VerificationCodeBloc
    extends Bloc<VerificationCodeEvent, VerificationCodeState> {
  VerificationCodeBloc(this._service) : super(VerificationCodeState.initial()) {
    on<_Verify>(_verify);
    on<_Resend>(_resend);
  }
  final VerificationCodeInterface _service;

  Future<void> _verify(
    _Verify event,
    Emitter<VerificationCodeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.verify(event.username, event.code);
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

  Future<void> _resend(
    _Resend event,
    Emitter<VerificationCodeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.resend(event.username);
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
