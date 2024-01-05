import 'package:freezed_annotation/freezed_annotation.dart';
part 'donation_dto.freezed.dart';
part 'donation_dto.g.dart';

@freezed
class DonationDto with _$DonationDto {
  const factory DonationDto({
    required int collectionItemId,
    required int amount,
  }) = _DonationDto;
  factory DonationDto.fromJson(Map<String, dynamic> json) =>
      _$DonationDtoFromJson(json);
}
