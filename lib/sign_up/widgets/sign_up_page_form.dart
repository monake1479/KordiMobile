part of 'package:kordi_mobile/sign_up/pages/sign_up_page.dart';

class _SignUpPageForm extends StatefulWidget {
  const _SignUpPageForm();

  @override
  State<_SignUpPageForm> createState() => __SignUpPageFormState();
}

class __SignUpPageFormState extends State<_SignUpPageForm> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
      builder: (context, state) {
        final signUpFormBloc = context.read<SignUpFormBloc>();

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.join.svg(
              width: MediaQuery.of(context).size.width * 0.35,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(),
                  labelText: S.current.signUpPageUsernameLabelTextField,
                  hintText: S.current.signUpPageUsernameHintTextField,
                  errorText: (state.showUsernameError)
                      ? S.current.signUpPageUsernameErrorTextField
                      : null,
                  prefixIcon: Icon(Icons.account_circle),
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
                  border: OutlineInputBorder(),
                  labelText: S.current.signUpPageFirstNameLabelTextField,
                  hintText: S.current.signUpPageFirstNameHintTextField,
                  errorText: (state.showFirstNameError)
                      ? S.current.signUpPageFirstNameErrorTextField
                      : null,
                  prefixIcon: Icon(Icons.person),
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
                  border: OutlineInputBorder(),
                  labelText: S.current.signUpPageLastNameLabelTextField,
                  hintText: S.current.signUpPageLastNameHintTextField,
                  errorText: (state.showLastNameError)
                      ? S.current.signUpPageLastNameErrorTextField
                      : null,
                  prefixIcon: Icon(Icons.person),
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
                obscureText: isObscure,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(),
                  labelText: S.current.signUpPagePasswordLabelTextField,
                  hintText: S.current.signUpPagePasswordHintTextField,
                  errorText: (state.showPasswordError)
                      ? S.current.signUpPagePasswordErrorTextField
                      : null,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(
                        () => isObscure = !isObscure,
                      );
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
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
                  border: OutlineInputBorder(),
                  labelText: S.current.signUpPageEmailLabelTextField,
                  hintText: S.current.signUpPageEmailHintTextField,
                  errorText: (state.showEmailError)
                      ? S.current.signUpPageEmailErrorTextField
                      : null,
                  prefixIcon: Icon(Icons.email),
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
                  border: OutlineInputBorder(),
                  labelText: S.current.signUpPagePhoneNumberLabelTextField,
                  hintText: S.current.signUpPagePhoneNumberHintTextField,
                  errorText: (state.showPhoneNumberError)
                      ? S.current.signUpPagePhoneNumberErrorTextField
                      : null,
                  prefixIcon: Icon(Icons.phone),
                ),
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
        );
      },
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
