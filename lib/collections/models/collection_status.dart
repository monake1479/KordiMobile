enum CollectionStatus {
  inProgress(name: 'In progress', value: 'IN_PROGRESS'),
  completed(name: 'Completed', value: 'COMPLETED'),
  archived(name: 'Archived', value: 'ARCHIVED');

  const CollectionStatus({
    required this.name,
    required this.value,
  });
  final String name;
  final String value;
}
