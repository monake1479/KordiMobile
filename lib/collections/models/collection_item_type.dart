enum CollectionItemType {
  weight(name: 'Weight', value: 'WEIGHT'),
  amount(name: 'Amount', value: 'AMOUNT'),
  unlimited(name: 'Unlimited', value: 'UNLIMITED');

  const CollectionItemType({
    required this.name,
    required this.value,
  });
  final String name;
  final String value;
}
