enum CollectionItemType {
  weight(
    name: 'Weight',
    value: 'WEIGHT',
    unitSuffix: 'kg',
  ),
  amount(
    name: 'Amount',
    value: 'AMOUNT',
    unitSuffix: 'pcs',
  ),
  unlimited(
    name: 'Unlimited',
    value: 'UNLIMITED',
    unitSuffix: '',
  );

  const CollectionItemType({
    required this.name,
    required this.value,
    required this.unitSuffix,
  });
  final String name, value, unitSuffix;
}

extension CollectionItemTypeX on CollectionItemType {
  bool get isWeight => this == CollectionItemType.weight;
  bool get isAmount => this == CollectionItemType.amount;
  bool get isUnlimited => this == CollectionItemType.unlimited;
}
