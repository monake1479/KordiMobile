import 'package:kordi_mobile/gen/l10n.dart';

enum CollectionStatus {
  inProgress(value: 'IN_PROGRESS'),
  completed(value: 'COMPLETED'),
  archived(value: 'ARCHIVED');

  const CollectionStatus({
    required this.value,
  });
  final String value;
}

extension CollectionStatusEx on CollectionStatus {
  String get name {
    switch (this) {
      case CollectionStatus.inProgress:
        return S.current.collectionStatusInProgressName;
      case CollectionStatus.completed:
        return S.current.collectionStatusCompletedName;
      case CollectionStatus.archived:
        return S.current.collectionStatusArchivedName;
    }
  }
}
