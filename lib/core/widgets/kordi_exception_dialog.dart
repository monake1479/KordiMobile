import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/auth/controllers/authentication/authentication_bloc.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';

class KordiExceptionDialog extends StatelessWidget {
  const KordiExceptionDialog({
    super.key,
    required this.exception,
  });
  final KordiException exception;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Kordi occurred an error...'),
      content: Text(exception.message),
      actions: [
        TextButton(
          onPressed: () {
            if (exception is Unauthorized) {
              log('Unauthorized, please sign in again.');
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationEvent.reset());
            } else {
              Navigator.of(context).pop();
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
