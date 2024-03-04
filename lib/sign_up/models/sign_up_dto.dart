// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_dto.freezed.dart';
part 'sign_up_dto.g.dart';

@freezed
class SignUpDto with _$SignUpDto {
  const factory SignUpDto({
    required String firstName,
    required String lastName,
    required String username,
    required String password,
    required String email,
    @JsonKey(name: 'phone') required String phoneNumber,
    required String verificationType,
  }) = _SignUpDto;
  factory SignUpDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpDtoFromJson(json);
}
