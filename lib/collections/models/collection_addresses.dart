import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_addresses.freezed.dart';
part 'collection_addresses.g.dart';

@freezed
class CollectionAddresses with _$CollectionAddresses {
  const factory CollectionAddresses({
    required String city,
    required String street,
  }) = _CollectionAddresses;
  factory CollectionAddresses.fromJson(Map<String, dynamic> json) =>
      _$CollectionAddressesFromJson(json);
}

extension CollectionAddressesX on CollectionAddresses {
  String get fullAddress => '$city, $street';
  Uri get googleMapsUrl => Uri(
        scheme: 'https',
        host: 'www.google.com',
        path: 'maps/place/$street,$city',
      );
}
