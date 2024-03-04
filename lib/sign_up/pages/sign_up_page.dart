import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/core/utils/kordi_flushbar.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';
import 'package:kordi_mobile/gen/l10n.dart';

import 'package:kordi_mobile/sign_up/controllers/sign_up_controllers.dart';
import 'package:kordi_mobile/sign_up/models/verification_type.dart';

part 'package:kordi_mobile/sign_up/widgets/sign_up_page_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignUpFormBloc>(
            create: (_) => getIt.get<SignUpFormBloc>(),
          ),
          BlocProvider<SignUpBloc>(
            create: (_) => getIt.get<SignUpBloc>(),
          ),
        ],
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) async {
            if (state.isSuccess) {
              await KordiFlushbar(
                maxWidth: 130,
                message: S.current.signUpPageFlushbarLabel,
                backgroundColor: colorScheme.onPrimary,
              ).show(context);
              final verificationType =
                  context.read<SignUpFormBloc>().state.verificationType;
              VerificationCodePageRoute(verificationType).go(context);
            }
            if (state.exception != null) {
              await KordiDialog.showException(
                context,
                state.exception!,
                overrideOnPressed: () {
                  context.read<SignUpBloc>().add(SignUpEvent.reset());
                  context.pop();
                },
              );
            }
          },
          child: Card(
            margin: const EdgeInsets.all(16),
            color: colorScheme.primaryContainer,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _SignUpPageForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
