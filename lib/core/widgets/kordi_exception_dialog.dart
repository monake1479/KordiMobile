import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kordi_mobile/auth/controllers/authentication/authentication_bloc.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/l10n/l10n.dart';
import 'package:kordi_mobile/resources/resources.dart';

class KordiExceptionDialog extends StatelessWidget {
  const KordiExceptionDialog({
    super.key,
    required this.exception,
    this.overrideOnPressed,
  });
  final KordiException exception;
  final void Function()? overrideOnPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.exceptionDialogTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            KordiImages.exception,
            width: MediaQuery.of(context).size.width * 0.35,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(exception.message),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (overrideOnPressed != null) {
              overrideOnPressed!();
              return;
            } else {
              if (exception is Unauthorized) {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationEvent.reset());
              } else {
                Navigator.of(context).pop();
              }
            }
          },
          child: Text(context.l10n.exceptionDialogButtonLabel),
        ),
      ],
    );
  }
}
