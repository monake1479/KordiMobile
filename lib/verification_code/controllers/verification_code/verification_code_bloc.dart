import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/verification_code/interfaces/verification_code_interface.dart';

part 'verification_code_state.dart';
part 'verification_code_event.dart';
part 'verification_code_bloc.freezed.dart';

@lazySingleton
class VerificationCodeBloc
    extends Bloc<VerificationCodeEvent, VerificationCodeState> {
  VerificationCodeBloc(this._service) : super(VerificationCodeState.initial()) {
    on<_VerifyByEmail>(_verifyByEmail);
    on<_VerifyByPhone>(_verifyByPhone);
    on<_Resend>(_resend);
  }
  final VerificationCodeInterface _service;

  Future<void> _verifyByEmail(
    _VerifyByEmail event,
    Emitter<VerificationCodeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final response = await _service.verifyByEmail(event.code);
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

  Future<void> _verifyByPhone(
    _VerifyByPhone event,
    Emitter<VerificationCodeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final response = await _service.verifyByPhone(
      event.phoneNumber,
      event.code,
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

  Future<void> _resend(
    _Resend event,
    Emitter<VerificationCodeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
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

  @override
  Future<void> close() async {
    await getIt.resetLazySingleton<VerificationCodeBloc>();
    return super.close();
  }
}
