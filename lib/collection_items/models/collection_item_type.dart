import 'package:kordi_mobile/gen/l10n.dart';

enum CollectionItemType {
  weight(
    value: 'WEIGHT',
  ),
  amount(
    value: 'AMOUNT',
  ),
  unlimited(
    value: 'UNLIMITED',
  );

  const CollectionItemType({
    required this.value,
  });
  final String value;
}

extension CollectionItemTypeX on CollectionItemType {
  bool get isWeight => this == CollectionItemType.weight;
  bool get isAmount => this == CollectionItemType.amount;
  bool get isUnlimited => this == CollectionItemType.unlimited;
  String get name {
    switch (this) {
      case CollectionItemType.weight:
        return S.current.collectionItemTypeWeightName;
      case CollectionItemType.amount:
        return S.current.collectionItemTypeAmountName;
      case CollectionItemType.unlimited:
        return S.current.collectionItemTypeUnlimitedName;
    }
  }

  String get unitSuffix {
    switch (this) {
      case CollectionItemType.weight:
        return S.current.collectionItemTypeUnitSuffixKg;
      case CollectionItemType.amount:
        return S.current.collectionItemTypeUnitSuffixPieces;
      case CollectionItemType.unlimited:
        return '';
    }
  }
}
