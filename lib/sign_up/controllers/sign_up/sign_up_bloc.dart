import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';
import 'package:kordi_mobile/sign_up/interfaces/sign_up_interface.dart';
import 'package:kordi_mobile/sign_up/models/sign_up_dto.dart';

part 'sign_up_bloc.freezed.dart';
part 'sign_up_state.dart';
part 'sign_up_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._service) : super(SignUpState.initial()) {
    on<_Reset>(_reset);
    on<_SignUp>(_signUp);
  }
  final SignUpInterface _service;

  void _reset(_Reset event, Emitter<SignUpState> emit) {
    emit(SignUpState.initial());
  }

  Future<void> _signUp(_SignUp event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.signUp(event.dto);
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
