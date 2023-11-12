import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/collections/utils/collection_status_converter.dart';
import 'package:kordi_mobile/core/utils/date_time_converter.dart';

part 'collection.freezed.dart';
part 'collection.g.dart';

@freezed
class Collection with _$Collection {
  const factory Collection({
    required int id,
    required String title,
    required String description,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime? endTime,
    @DateTimeConverter() required DateTime? completedTime,
    // required Uint8List image,
    required int donates,
    @CollectionStatusConverter() required CollectionStatus status,
    required int userId,
    required List<CollectionAddresses> addresses,
    required List<CollectionItem> items,
    required List<Comment>? comments,
  }) = _Collection;
  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
}

extension CollectionEx on Collection {
  String get daysToComplete {
    final DateTime now = DateTime.now();
    final DateTime endTime = this.endTime ?? DateTime.now();
    final Duration difference = endTime.difference(now);
    final int days = difference.inDays;
    return days.toString();
  }
}
