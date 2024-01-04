import 'package:kordi_mobile/gen/l10n.dart';

enum CollectionItemType {
  weight(
    value: 'WEIGHT',
    unitSuffix: 'kg',
  ),
  amount(
    value: 'AMOUNT',
    unitSuffix: 'pcs',
  ),
  unlimited(
    value: 'UNLIMITED',
    unitSuffix: '',
  );

  const CollectionItemType({
    required this.value,
    required this.unitSuffix,
  });
  final String value, unitSuffix;
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
}
