import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/sign_in/controllers/sign_in/sign_in_bloc.dart';
import 'package:kordi_mobile/sign_in/models/sign_in_dto.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@lazySingleton
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc(this._signInBloc) : super(SignInFormState.initial()) {
    on<_UpdateUsername>(_updateUsername);
    on<_UpdatePassword>(_updatePassword);
    on<_ValidateFields>(_validateFields);
    on<_SignIn>(_signIn);
  }

  final SignInBloc _signInBloc;
  void _updateUsername(_UpdateUsername event, Emitter<SignInFormState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _updatePassword(_UpdatePassword event, Emitter<SignInFormState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _validateFields(
    _ValidateFields event,
    Emitter<SignInFormState> emit,
  ) {
    if (!state.isUsernameValid) {
      emit(state.copyWith(username: ''));
    }
    if (!state.isPasswordValid) {
      emit(state.copyWith(password: ''));
    }
  }

  void _signIn(_SignIn event, Emitter<SignInFormState> emit) {
    emit(state.copyWith(isLoading: true));
    _signInBloc.add(SignInEvent.signIn(state.dto));
    emit(state.copyWith(isLoading: false));
  }

  @override
  Future<void> close() async {
    await getIt.resetLazySingleton<SignInFormBloc>();
    return super.close();
  }
}
