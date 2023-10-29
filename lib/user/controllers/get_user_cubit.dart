import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/either_extension.dart';
import 'package:kordi_mobile/user/interfaces/get_user_interface.dart';
import 'package:kordi_mobile/user/models/user.dart';

part 'get_user_state.dart';
part 'get_user_cubit.freezed.dart';

@lazySingleton
class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit(this._service) : super(GetUserState.initial());
  final GetUserInterface _service;
  Future<void> get() async {
    emit(state.copyWith(isLoading: true));
    final response = await _service.getUser();
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

  void reset() {
    log('[GetUserCubit] reset()');
    emit(GetUserState.initial());
  }
}
