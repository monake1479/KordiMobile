import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/auth/controllers/auth_cubit.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/sign_in/interface/sign_in_interface.dart';
import 'package:kordi_mobile/sign_in/models/sign_in_dto.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

@lazySingleton
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this._service, this._authCubit) : super(SignInState.initial()) {
    on<_SignIn>(_signIn);
  }
  final SignInInterface _service;
  final AuthCubit _authCubit;
  Future<void> _signIn(_SignIn event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final response = await _service.signIn(event.dto);
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
        failureOrSuccessOption: some(right(unit)),
      ),
    );
    _authCubit.changeAuthState(event.dto.username, response.getRightOrThrow());
  }

  @override
  Future<void> close() async {
    await getIt.resetLazySingleton<SignInBloc>();
    return super.close();
  }
}
