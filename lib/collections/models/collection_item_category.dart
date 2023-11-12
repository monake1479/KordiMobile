enum CollectionItemCategory {
  food(name: 'Food', value: 'FOOD'),
  clothes(name: 'Clothes', value: 'CLOTHES'),
  animals(name: 'Animals', value: 'ANIMALS'),
  children(name: 'Children', value: 'CHILDREN'),
  electronic(name: 'Electronic', value: 'ELECTRONIC'),
  medicines(name: 'Medicines', value: 'MEDICINE'),
  other(name: 'Other', value: 'OTHER');

  const CollectionItemCategory({
    required this.name,
    required this.value,
  });
  final String name;
  final String value;
}
