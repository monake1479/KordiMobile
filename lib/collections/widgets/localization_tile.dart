import 'package:flutter/material.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/l10n/l10n.dart';

class LocalizationTile extends StatefulWidget {
  LocalizationTile({super.key, required this.addresses});
  final List<CollectionAddresses> addresses;

  @override
  State<LocalizationTile> createState() => _LocalizationTileState();
}

class _LocalizationTileState extends State<LocalizationTile> {
  final ExpansionTileController _controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    if (widget.addresses.isEmpty) {
      return const SizedBox();
    }
    return ExpansionTile(
      controller: _controller,
      collapsedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: Text(
        context.l10n.collectionPageLocations,
      ),
      leading: Icon(Icons.location_on),
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      children: widget.addresses
          .map(
            (address) => Text(
              address.fullAddress,
              textAlign: TextAlign.left,
            ),
          )
          .toList(),
    );
  }
}
