import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/auth/controllers/auth_cubit.dart';
import 'package:kordi_mobile/change_password/controllers/change_password/change_password_bloc.dart';
import 'package:kordi_mobile/change_password/controllers/change_password_form/change_password_form_bloc.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';
import 'package:kordi_mobile/gen/l10n.dart';
part 'package:kordi_mobile/change_password/widgets/change_password_form.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt.get<ChangePasswordBloc>()),
          BlocProvider(create: (_) => getIt.get<ChangePasswordFormBloc>()),
        ],
        child: BlocListener<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) async {
            if (state.isSuccess) {
              await KordiDialog.show(
                context,
                title: S.current.changePasswordPageDialogTitleLabel,
                subtitle: S.current.changePasswordPageDialogSubTitleLabel,
                buttonLabel: S.current.changePasswordPageDialogButtonLabel,
                onButtonOnPressed: () {
                  context.read<AuthCubit>().signOut();
                  context.pop();
                  CollectionPageRoute().go(context);
                },
              );
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
          child: _ChangePasswordForm(),
        ),
      ),
    );
  }
}
