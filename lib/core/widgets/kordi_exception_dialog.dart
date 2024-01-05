import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/auth/controllers/auth_cubit.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';
import 'package:kordi_mobile/gen/l10n.dart';

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
    return AlertDialog.adaptive(
      title: Text(S.current.exceptionDialogTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.exception.svg(
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
                context.read<AuthCubit>().signOut();
              }
              Navigator.of(context).pop();
            }
          },
          child: Text(S.current.exceptionDialogButtonLabel),
        ),
      ],
    );
  }
}
