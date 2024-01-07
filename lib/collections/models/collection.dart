import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kordi_mobile/collection_items/models/collection_items_models.dart';
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
    required List<CollectionAddress> addresses,
    required List<CollectionItem> items,
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

  double get progress {
    final int donates = this.donates;
    final int items = this.items.length;
    final double progress = donates / items;
    return progress;
  }

  double get timeProgress {
    final DateTime now = DateTime.now();
    final DateTime startTime = this.startTime;
    final DateTime endTime = this.endTime ?? DateTime.now();
    final Duration difference = endTime.difference(startTime);
    final Duration differenceNow = now.difference(startTime);
    return differenceNow.inDays / difference.inDays;
  }

  double get timeProgressInPercents {
    final double progress = this.timeProgress;
    final double progressInPercents = progress * 100;
    if (progressInPercents > 100) {
      return 100;
    }
    return progressInPercents;
  }

  List<String> get categoriesNames {
    final List<String> categoriesNames = [];
    for (final item in items) {
      if (!categoriesNames.contains(item.category.name)) {
        categoriesNames.add(item.category.name);
      }
    }
    return categoriesNames;
  }
}
