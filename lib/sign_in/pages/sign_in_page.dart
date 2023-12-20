import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/core/utils/kordi_flushbar.dart';
import 'package:kordi_mobile/core/utils/kordi_routes.dart';
import 'package:kordi_mobile/core/widgets/kordi_text_field.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';
import 'package:kordi_mobile/gen/l10n.dart';

import 'package:kordi_mobile/sign_in/controllers/sign_in/sign_in_bloc.dart';
import 'package:kordi_mobile/sign_in/controllers/sign_in_form/sign_in_form_bloc.dart';
import 'package:kordi_mobile/user/controllers/get_user_cubit.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

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
          child: BlocBuilder<SignInFormBloc, SignInFormState>(
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
                                child: KordiTextField(
                                  labelText: S
                                      .current.signInPageUsernameLabelTextField,
                                  hintText:
                                      S.current.signInPageUsernameHintTextField,
                                  shouldShowErrorText: state.showUsernameError,
                                  errorText: S
                                      .current.signInPageUsernameErrorTextField,
                                  prefixIcon: Icon(Icons.person),
                                  onChanged: (username) => signInFormBloc.add(
                                    SignInFormEvent.updateUsername(username),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: KordiTextField(
                                  obscureNeeded: true,
                                  shouldShowErrorText: state.showPasswordError,
                                  labelText: S
                                      .current.signInPagePasswordLabelTextField,
                                  hintText:
                                      S.current.signInPagePasswordHintTextField,
                                  errorText: S
                                      .current.signInPagePasswordErrorTextField,
                                  prefixIcon: Icon(Icons.lock),
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
                                      text: S
                                          .current.signInPageSignUpButtonLabel1,
                                      children: [
                                        TextSpan(
                                          text: S.current
                                              .signInPageSignUpButtonLabel2,
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
          ),
        ),
      ),
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
