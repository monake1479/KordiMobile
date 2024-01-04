import 'package:flutter/material.dart';
import 'package:kordi_mobile/gen/l10n.dart';

enum CollectionItemCategory {
  food(
    value: 'FOOD',
    icon: Icons.restaurant,
  ),
  clothes(
    value: 'CLOTHES',
    icon: Icons.checkroom_rounded,
  ),
  animals(
    value: 'ANIMALS',
    icon: Icons.pets,
  ),
  children(
    value: 'CHILDREN',
    icon: Icons.child_friendly,
  ),
  electronic(
    value: 'ELECTRONIC',
    icon: Icons.electrical_services,
  ),
  medicines(
    value: 'MEDICINE',
    icon: Icons.medical_services,
  ),
  other(
    value: 'OTHER',
    icon: Icons.more_horiz,
  );

  const CollectionItemCategory({
    required this.value,
    required this.icon,
  });
  final String value;
  final IconData icon;
}

extension CollectionItemCategoryEx on CollectionItemCategory {
  String get name {
    switch (this) {
      case CollectionItemCategory.food:
        return S.current.collectionItemCategoryFoodName;
      case CollectionItemCategory.clothes:
        return S.current.collectionItemCategoryClothesName;
      case CollectionItemCategory.animals:
        return S.current.collectionItemCategoryAnimalsName;
      case CollectionItemCategory.children:
        return S.current.collectionItemCategoryChildrenName;
      case CollectionItemCategory.electronic:
        return S.current.collectionItemCategoryElectronicName;
      case CollectionItemCategory.medicines:
        return S.current.collectionItemCategoryMedicinesName;
      case CollectionItemCategory.other:
        return S.current.collectionItemCategoryOtherName;
    }
  }
}
