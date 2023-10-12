import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/transitions/fade_transition_page.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/l10n/l10n.dart';
import 'package:kordi_mobile/resources/resources.dart';
import 'package:kordi_mobile/sign_up/controllers/sign_up_form/sign_up_form_bloc.dart';
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
      child: BlocProvider(
        create: (context) => getIt.get<SignUpFormBloc>(),
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
                            labelText:
                                context.l10n.signUpPageFirstNameLabelTextField,
                            hintText:
                                context.l10n.signUpPageFirstNameHintTextField,
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
                            hintText: context.l10n.signUpPageEmailHintTextField,
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
                            hintText:
                                context.l10n.signUpPagePhoneNumberHintTextField,
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                          maxLength: 9,
                          onChanged: (phoneNumber) => signUpFormBloc.add(
                            SignUpFormEvent.updatePhoneNumber(phoneNumber),
                          ),
                        ),
                      ),
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
                        // onPressed: () => log('SignUp call'),
                        onPressed: () => KordiDialog.showException(
                          context,
                          KordiException.unauthorized(),
                        ),
                        child: Text(context.l10n.signUpPageSignUpButtonLabel),
                      ),
                      TextButton(
                        onPressed: () => log('Sign In navigation'),
                        child: Text.rich(
                          TextSpan(
                            text:
                                context.l10n.signUpPageAlreadyHaveAccountLabel,
                            children: [
                              TextSpan(
                                text: context.l10n.signUpPageSignInButtonLabel,
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
    );
  }
}
