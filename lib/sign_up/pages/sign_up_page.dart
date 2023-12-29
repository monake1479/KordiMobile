import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/core/utils/kordi_flushbar.dart';
import 'package:kordi_mobile/core/widgets/kordi_text_field.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';
import 'package:kordi_mobile/gen/l10n.dart';

import 'package:kordi_mobile/sign_up/controllers/sign_up_controllers.dart';
import 'package:kordi_mobile/sign_up/models/verification_type.dart';

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
          child: BlocBuilder<SignUpFormBloc, SignUpFormState>(
            builder: (context, state) {
              final signUpFormBloc = context.read<SignUpFormBloc>();

              return Card(
                margin: const EdgeInsets.all(16),
                color: colorScheme.primaryContainer,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.images.join.svg(
                          width: MediaQuery.of(context).size.width * 0.35,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: KordiTextField(
                            labelText:
                                S.current.signUpPageUsernameLabelTextField,
                            hintText: S.current.signUpPageUsernameHintTextField,
                            shouldShowErrorText: state.showUsernameError,
                            errorText:
                                S.current.signUpPageUsernameErrorTextField,
                            prefixIcon: Icon(Icons.account_circle),
                            onChanged: (username) => signUpFormBloc.add(
                              SignUpFormEvent.updateUsername(username),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: KordiTextField(
                            labelText:
                                S.current.signUpPageFirstNameLabelTextField,
                            hintText:
                                S.current.signUpPageFirstNameHintTextField,
                            shouldShowErrorText: state.showFirstNameError,
                            errorText:
                                S.current.signUpPageFirstNameErrorTextField,
                            prefixIcon: Icon(Icons.person),
                            keyboardType: TextInputType.name,
                            onChanged: (firstName) => signUpFormBloc.add(
                              SignUpFormEvent.updateFirstName(firstName),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: KordiTextField(
                            labelText:
                                S.current.signUpPageLastNameLabelTextField,
                            hintText: S.current.signUpPageLastNameHintTextField,
                            shouldShowErrorText: state.showLastNameError,
                            errorText:
                                S.current.signUpPageLastNameErrorTextField,
                            prefixIcon: Icon(Icons.person),
                            keyboardType: TextInputType.name,
                            onChanged: (lastName) => signUpFormBloc.add(
                              SignUpFormEvent.updateLastName(lastName),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: KordiTextField(
                            obscureNeeded: true,
                            shouldShowErrorText: state.showPasswordError,
                            prefixIcon: Icon(Icons.lock),
                            labelText:
                                S.current.signUpPagePasswordLabelTextField,
                            hintText: S.current.signUpPagePasswordHintTextField,
                            errorText:
                                S.current.signUpPagePasswordErrorTextField,
                            onChanged: (password) => signUpFormBloc.add(
                              SignUpFormEvent.updatePassword(password),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: KordiTextField(
                            labelText: S.current.signUpPageEmailLabelTextField,
                            hintText: S.current.signUpPageEmailHintTextField,
                            shouldShowErrorText: state.showEmailError,
                            errorText: S.current.signUpPageEmailErrorTextField,
                            prefixIcon: Icon(Icons.email),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (email) => signUpFormBloc.add(
                              SignUpFormEvent.updateEmail(email),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: KordiTextField(
                            labelText:
                                S.current.signUpPagePhoneNumberLabelTextField,
                            hintText:
                                S.current.signUpPagePhoneNumberHintTextField,
                            shouldShowErrorText: state.showPhoneNumberError,
                            errorText:
                                S.current.signUpPagePhoneNumberErrorTextField,
                            prefixIcon: Icon(Icons.phone),
                            keyboardType: TextInputType.number,
                            maxLength: 9,
                            onChanged: (phoneNumber) => signUpFormBloc.add(
                              SignUpFormEvent.updatePhoneNumber(phoneNumber),
                            ),
                          ),
                        ),
                        Text(S.current.signUpPageVerificationTypeLabel),
                        DropdownButton<VerificationType>(
                          value: state.verificationType,
                          items: VerificationType.values
                              .map(
                                (verificationType) => DropdownMenuItem(
                                  value: verificationType,
                                  child: Text(verificationType.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) => signUpFormBloc.add(
                            SignUpFormEvent.updateVerificationType(
                              value ?? VerificationType.email,
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
                            _onSignUpButtonClicked(context);
                          },
                          child: Builder(
                            builder: (context) {
                              if (state.isLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Text(
                                S.current.signUpPageSignUpButtonLabel,
                              );
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () => SignInPageRoute().go(context),
                          child: Text.rich(
                            TextSpan(
                              text: S.current.signUpPageAlreadyHaveAccountLabel,
                              children: [
                                TextSpan(
                                  text: S.current.signUpPageSignInButtonLabel,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
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

  void _onSignUpButtonClicked(BuildContext context) {
    final signUpFormBloc = context.read<SignUpFormBloc>();
    final state = signUpFormBloc.state;
    FocusScope.of(context).unfocus();
    if (!state.isFormValid) {
      signUpFormBloc.add(
        SignUpFormEvent.validateFields(),
      );
      return;
    }
    signUpFormBloc.add(
      SignUpFormEvent.signUp(),
    );
  }
}
