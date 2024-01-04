part of 'package:kordi_mobile/sign_in/pages/sign_in_page.dart';

class _SignInPageForm extends StatefulWidget {
  const _SignInPageForm();

  @override
  State<_SignInPageForm> createState() => __SignInPageFormState();
}

class __SignInPageFormState extends State<_SignInPageForm> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return BlocBuilder<SignInFormBloc, SignInFormState>(
      builder: (context, state) {
        final signInFormBloc = context.read<SignInFormBloc>();
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
                        Assets.images.welcoming.svg(
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(),
                              labelText:
                                  S.current.signInPageUsernameLabelTextField,
                              hintText:
                                  S.current.signInPageUsernameHintTextField,
                              errorText: (state.showUsernameError)
                                  ? S.current.signInPageUsernameErrorTextField
                                  : null,
                              prefixIcon: Icon(Icons.person),
                            ),
                            onChanged: (username) => signInFormBloc.add(
                              SignInFormEvent.updateUsername(username),
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
                              labelText:
                                  S.current.signInPagePasswordLabelTextField,
                              hintText:
                                  S.current.signInPagePasswordHintTextField,
                              errorText: (state.showPasswordError)
                                  ? S.current.signInPagePasswordErrorTextField
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
                            onChanged: (password) => signInFormBloc.add(
                              SignInFormEvent.updatePassword(password),
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
                            _onSignInButtonClicked(context);
                          },
                          child: Builder(
                            builder: (context) {
                              if (state.isLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Text(
                                S.current.signInPageSignInButtonLabel,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: TextButton(
                            onPressed: () {
                              SignUpPageRoute().go(context);
                            },
                            child: Text.rich(
                              TextSpan(
                                text: S.current.signInPageSignUpButtonLabel1,
                                children: [
                                  TextSpan(
                                    text:
                                        S.current.signInPageSignUpButtonLabel2,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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

  void _onSignInButtonClicked(BuildContext context) {
    final signInFormBloc = context.read<SignInFormBloc>();
    final state = signInFormBloc.state;
    FocusScope.of(context).unfocus();
    if (!state.isFormValid) {
      signInFormBloc.add(
        SignInFormEvent.validateFields(),
      );
      return;
    }
    signInFormBloc.add(
      SignInFormEvent.signIn(),
    );
  }
}
