import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/core/utils/kordi_flushbar.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';
import 'package:kordi_mobile/gen/l10n.dart';

import 'package:kordi_mobile/sign_in/controllers/sign_in/sign_in_bloc.dart';
import 'package:kordi_mobile/sign_in/controllers/sign_in_form/sign_in_form_bloc.dart';
import 'package:kordi_mobile/user/controllers/get_user_cubit.dart';

part 'package:kordi_mobile/sign_in/widgets/sign_in_page_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt.get<SignInFormBloc>()),
          BlocProvider(create: (_) => getIt.get<SignInBloc>()),
        ],
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) async {
            if (state.isSuccess) {
              await KordiFlushbar(
                maxWidth: 130,
                message: S.current.signInPageFlushbarLabel,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
              ).show(context);
              await context.read<GetUserCubit>().get();
              CollectionPageRoute().go(context);
            }
            if (state.exception != null) {
              await KordiDialog.showException(
                context,
                state.exception!,
                overrideOnPressed: () {
                  context.pop();
                },
              );
            }
          },
          child: _SignInPageForm(),
        ),
      ),
    );
  }
}
