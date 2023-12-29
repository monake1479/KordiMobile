import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_address.freezed.dart';
part 'collection_address.g.dart';

@freezed
class CollectionAddress with _$CollectionAddress {
  const factory CollectionAddress({
    @Default(null) int? id,
    required String city,
    required String street,
  }) = _CollectionAddress;
  factory CollectionAddress.fromJson(Map<String, dynamic> json) =>
      _$CollectionAddressFromJson(json);
}

extension CollectionAddressX on CollectionAddress {
  String get fullAddress => '$city, $street';
  Uri get googleMapsUrl => Uri(
        scheme: 'https',
        host: 'www.google.com',
        path: 'maps/place/$street,$city',
      );
}
