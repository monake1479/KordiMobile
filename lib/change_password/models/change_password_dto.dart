import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_dto.freezed.dart';
part 'change_password_dto.g.dart';

@freezed
class ChangePasswordDto with _$ChangePasswordDto {
  const factory ChangePasswordDto({
    required String password,
    required String oldPassword,
  }) = _ChangePasswordDto;
  factory ChangePasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordDtoFromJson(json);
}
