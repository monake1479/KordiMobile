import 'package:flag/flag_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'localization_event.dart';
part 'localization_bloc.freezed.dart';

@injectable
class LocalizationBloc extends Bloc<LocalizationEvent, Locale> {
  LocalizationBloc() : super(Locale('pl')) {
    on<_Reset>(_reset);
    on<_ChangeLocale>(_changeLocale);
  }
  FlagsCode get currentFlagCode {
    if (state == Locale('en')) {
      return FlagsCode.GB;
    } else {
      return FlagsCode.PL;
    }
  }

  void _reset(_Reset event, Emitter<Locale> emit) {
    emit(Locale('pl'));
  }

  void _changeLocale(_ChangeLocale event, Emitter<Locale> emit) {
    if (state == Locale('en')) {
      emit(Locale('pl'));
    } else {
      emit(Locale('en'));
    }
  }
}
