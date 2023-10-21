import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/core/transitions/fade_transition_page.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/l10n/l10n.dart';
import 'package:kordi_mobile/resources/resources.dart';
import 'package:kordi_mobile/sign_up/controllers/sign_up_controllers.dart';
import 'package:kordi_mobile/sign_up/models/verification_type.dart';

@immutable
class SignUpPageRoute extends GoRouteData {
  SignUpPageRoute();

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: SignUpPage(),
      );
}

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
            create: (context) => getIt.get<SignUpFormBloc>(),
          ),
          BlocProvider<SignUpBloc>(
            create: (context) => getIt.get<SignUpBloc>(),
          ),
        ],
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state.exception != null) {
              KordiDialog.showException(
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
                        SvgPicture.asset(
                          KordiImages.join,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              labelText:
                                  context.l10n.signUpPageUsernameLabelTextField,
                              hintText:
                                  context.l10n.signUpPageUsernameHintTextField,
                              errorText: state.showUsernameError
                                  ? context
                                      .l10n.signUpPageUsernameErrorTextField
                                  : null,
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (username) => signUpFormBloc.add(
                              SignUpFormEvent.updateUsername(username),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              labelText: context
                                  .l10n.signUpPageFirstNameLabelTextField,
                              hintText:
                                  context.l10n.signUpPageFirstNameHintTextField,
                              errorText: state.showFirstNameError
                                  ? context
                                      .l10n.signUpPageFirstNameErrorTextField
                                  : null,
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.name,
                            onChanged: (firstName) => signUpFormBloc.add(
                              SignUpFormEvent.updateFirstName(firstName),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              labelText:
                                  context.l10n.signUpPageLastNameLabelTextField,
                              hintText:
                                  context.l10n.signUpPageLastNameHintTextField,
                              errorText: state.showLastNameError
                                  ? context
                                      .l10n.signUpPageLastNameErrorTextField
                                  : null,
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.name,
                            onChanged: (lastName) => signUpFormBloc.add(
                              SignUpFormEvent.updateLastName(lastName),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              labelText:
                                  context.l10n.signUpPagePasswordLabelTextField,
                              hintText:
                                  context.l10n.signUpPagePasswordHintTextField,
                              errorText: state.showPasswordError
                                  ? context
                                      .l10n.signUpPagePasswordErrorTextField
                                  : null,
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (password) => signUpFormBloc.add(
                              SignUpFormEvent.updatePassword(password),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              labelText:
                                  context.l10n.signUpPageEmailLabelTextField,
                              hintText:
                                  context.l10n.signUpPageEmailHintTextField,
                              errorText: state.showEmailError
                                  ? context.l10n.signUpPageEmailErrorTextField
                                  : null,
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (email) => signUpFormBloc.add(
                              SignUpFormEvent.updateEmail(email),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              labelText: context
                                  .l10n.signUpPagePhoneNumberLabelTextField,
                              hintText: context
                                  .l10n.signUpPagePhoneNumberHintTextField,
                              errorText: state.showPhoneNumberError
                                  ? context
                                      .l10n.signUpPagePhoneNumberErrorTextField
                                  : null,
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 9,
                            onChanged: (phoneNumber) => signUpFormBloc.add(
                              SignUpFormEvent.updatePhoneNumber(phoneNumber),
                            ),
                          ),
                        ),
                        Text(context.l10n.signUpPageVerificationTypeLabel),
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
                            if (state.isFormValid) {
                              signUpFormBloc.add(
                                SignUpFormEvent.signUp(),
                              );
                            } else {
                              signUpFormBloc.add(
                                SignUpFormEvent.validateFields(),
                              );
                            }
                          },
                          child: Builder(
                            builder: (context) {
                              if (state.isLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Text(
                                context.l10n.signUpPageSignUpButtonLabel,
                              );
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          // onPressed: () => SignInPageRoute().go(context),
                          child: Text.rich(
                            TextSpan(
                              text: context
                                  .l10n.signUpPageAlreadyHaveAccountLabel,
                              children: [
                                TextSpan(
                                  text:
                                      context.l10n.signUpPageSignInButtonLabel,
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
}
