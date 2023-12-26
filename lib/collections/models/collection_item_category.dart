import 'package:flutter/material.dart';

enum CollectionItemCategory {
  food(
    name: 'Food',
    value: 'FOOD',
    icon: Icons.restaurant,
  ),
  clothes(
    name: 'Clothes',
    value: 'CLOTHES',
    icon: Icons.checkroom_rounded,
  ),
  animals(
    name: 'Animals',
    value: 'ANIMALS',
    icon: Icons.pets,
  ),
  children(
    name: 'Children',
    value: 'CHILDREN',
    icon: Icons.child_friendly,
  ),
  electronic(
    name: 'Electronic',
    value: 'ELECTRONIC',
    icon: Icons.electrical_services,
  ),
  medicines(
    name: 'Medicines',
    value: 'MEDICINE',
    icon: Icons.medical_services,
  ),
  other(
    name: 'Other',
    value: 'OTHER',
    icon: Icons.more_horiz,
  );

  const CollectionItemCategory({
    required this.name,
    required this.value,
    required this.icon,
  });
  final String name, value;
  final IconData icon;
}
