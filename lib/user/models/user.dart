import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/core/utils/verification_type_converter.dart';
import 'package:kordi_mobile/sign_up/models/verification_type.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phone,
    required bool enabled,
    @VerificationTypeConverter() required VerificationType verificationType,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
