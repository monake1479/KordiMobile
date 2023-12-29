import 'package:flutter/material.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';
import 'package:kordi_mobile/gen/l10n.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.exceptionDescription});
  final String exceptionDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            CollectionPageRoute().go(context);
          },
        ),
        title: Text(S.current.exceptionDialogTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Assets.images.exception.svg(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(exceptionDescription),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 24,
              right: 24,
            ),
            child: Text(
              S.current.errorPageDescription,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ElevatedButton(
              onPressed: () {
                CollectionPageRoute().go(context);
              },
              child: Text(S.current.exceptionDialogButtonLabel),
            ),
          ),
        ],
      ),
    );
  }
}
