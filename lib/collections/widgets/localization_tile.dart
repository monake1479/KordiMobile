import 'package:flutter/material.dart';

class LocalizationTile extends StatefulWidget {
  LocalizationTile({super.key});

  @override
  State<LocalizationTile> createState() => _LocalizationTileState();
}

class _LocalizationTileState extends State<LocalizationTile> {
  final ExpansionTileController _controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controller: _controller,
      collapsedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: Text('Locations'),
      leading: Icon(Icons.location_on),
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      children: [
        Text(
          'Warszawa, Mała 10',
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
