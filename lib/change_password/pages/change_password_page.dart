import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/auth/controllers/auth_cubit.dart';
import 'package:kordi_mobile/change_password/controllers/change_password/change_password_bloc.dart';
import 'package:kordi_mobile/change_password/controllers/change_password_form/change_password_form_bloc.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/core/utils/kordi_routes.dart';
import 'package:kordi_mobile/core/widgets/kordi_text_field.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/l10n/l10n.dart';
import 'package:kordi_mobile/resources/resources.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final l10n = context.l10n;
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
                title: l10n.changePasswordPageDialogTitleLabel,
                subtitle: l10n.changePasswordPageDialogSubTitleLabel,
                buttonLabel: l10n.changePasswordPageDialogButtonLabel,
                onButtonOnPressed: () {
                  context.read<AuthCubit>().signOut();
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
          child: BlocBuilder<ChangePasswordFormBloc, ChangePasswordFormState>(
            builder: (context, state) {
              final changePasswordFormBloc =
                  context.read<ChangePasswordFormBloc>();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: colorScheme.primaryContainer,
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                KordiImages.changePassword,
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: KordiTextField(
                                  obscureNeeded: true,
                                  labelText: l10n
                                      .changePasswordPageOldPasswordLabelTextField,
                                  hintText: l10n
                                      .changePasswordPageOldPasswordHintTextField,
                                  shouldShowErrorText:
                                      state.showOldPasswordError,
                                  errorText: l10n
                                      .changePasswordPageOldPasswordErrorTextField,
                                  prefixIcon: Icon(Icons.lock_clock),
                                  onChanged: (oldPassword) =>
                                      changePasswordFormBloc.add(
                                    ChangePasswordFormEvent.updateOldPassword(
                                      oldPassword,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: KordiTextField(
                                  obscureNeeded: true,
                                  shouldShowErrorText: state.showPasswordError,
                                  labelText: l10n
                                      .changePasswordPagePasswordLabelTextField,
                                  hintText: l10n
                                      .changePasswordPagePasswordHintTextField,
                                  errorText: l10n
                                      .changePasswordPagePasswordErrorTextField,
                                  prefixIcon: Icon(Icons.lock),
                                  onChanged: (password) =>
                                      changePasswordFormBloc.add(
                                    ChangePasswordFormEvent.updatePassword(
                                      password,
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                    Size(
                                      MediaQuery.of(context).size.width * 0.65,
                                      50,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  _onChangePasswordButtonClicked(context);
                                },
                                child: BlocBuilder<ChangePasswordBloc,
                                    ChangePasswordState>(
                                  builder: (context, state) {
                                    if (state.isLoading) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return Text(
                                      l10n.changePasswordPageChangePasswordButtonLabel,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onChangePasswordButtonClicked(BuildContext context) {
    final changePasswordFormBloc = context.read<ChangePasswordFormBloc>();
    final state = changePasswordFormBloc.state;
    FocusScope.of(context).unfocus();
    if (!state.isFormValid) {
      changePasswordFormBloc.add(
        ChangePasswordFormEvent.validateFields(),
      );
      return;
    }
    changePasswordFormBloc.add(
      ChangePasswordFormEvent.changePassword(),
    );
  }
}
