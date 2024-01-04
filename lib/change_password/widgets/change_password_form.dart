part of 'package:kordi_mobile/change_password/pages/change_password_page.dart';

class _ChangePasswordForm extends StatefulWidget {
  const _ChangePasswordForm();

  @override
  State<_ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<_ChangePasswordForm> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return BlocBuilder<ChangePasswordFormBloc, ChangePasswordFormState>(
      builder: (context, state) {
        final changePasswordFormBloc = context.read<ChangePasswordFormBloc>();
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
                        Assets.images.changePassword.svg(
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            obscureText: isObscure,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(),
                              labelText: S.current
                                  .changePasswordPageOldPasswordLabelTextField,
                              hintText: S.current
                                  .changePasswordPageOldPasswordHintTextField,
                              errorText: state.showOldPasswordError
                                  ? S.current
                                      .changePasswordPageOldPasswordErrorTextField
                                  : null,
                              prefixIcon: Icon(Icons.lock_clock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(
                                    () => isObscure = !isObscure,
                                  );
                                },
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
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
                          child: TextFormField(
                            obscureText: isObscure,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(),
                              labelText: S.current
                                  .changePasswordPagePasswordLabelTextField,
                              hintText: S.current
                                  .changePasswordPagePasswordHintTextField,
                              errorText: state.showPasswordError
                                  ? S.current
                                      .changePasswordPagePasswordErrorTextField
                                  : null,
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(
                                    () => isObscure = !isObscure,
                                  );
                                },
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                            onChanged: (password) => changePasswordFormBloc.add(
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
                                S.current
                                    .changePasswordPageChangePasswordButtonLabel,
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
