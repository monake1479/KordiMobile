part of 'localization_bloc.dart';

@freezed
class LocalizationEvent with _$LocalizationEvent {
  const factory LocalizationEvent.reset() = _Reset;
  const factory LocalizationEvent.changeLocale() = _ChangeLocale;
}
