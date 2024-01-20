import 'package:flutter/material.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/gen/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class LocalizationTile extends StatefulWidget {
  LocalizationTile({super.key, required this.addresses});
  final List<CollectionAddress> addresses;

  @override
  State<LocalizationTile> createState() => _LocalizationTileState();
}

class _LocalizationTileState extends State<LocalizationTile> {
  final ExpansionTileController _controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
        S.current.collectionPageLocations,
      ),
      leading: Icon(Icons.location_on),
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      children: widget.addresses
          .map(
            (address) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    address.fullAddress,
                    textAlign: TextAlign.left,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await _onLocationButtonOnTap(
                      address,
                      context,
                    );
                  },
                  icon: Icon(
                    Icons.map_rounded,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  Future<void> _onLocationButtonOnTap(
    CollectionAddress address,
    BuildContext context,
  ) async {
    if (!await canLaunchUrl(address.googleMapsUrl)) {
      await KordiDialog.showException(
        context,
        KordiException.customMessage(
          message: S.current.collectionDetailsAddressesUrlException,
        ),
      );
    }
    await launchUrl(address.googleMapsUrl);
  }
}
