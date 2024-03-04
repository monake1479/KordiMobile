part of 'package:kordi_mobile/verification_code/pages/verification_code_page.dart';

class _VerificationCodePageForm extends StatelessWidget {
  const _VerificationCodePageForm(this.verificationType);
  final VerificationType verificationType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return BlocBuilder<VerificationCodeFormBloc, VerificationCodeFormState>(
      builder: (context, state) {
        final verificationCodeFormBloc =
            context.read<VerificationCodeFormBloc>();
        return Column(
          children: [
            Builder(
              builder: (context) {
                if (verificationType == VerificationType.phoneNumber) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                        labelText: S
                            .current.verificationCodePageTextfieldUsernameLabel,
                        hintText:
                            S.current.verificationCodePageTextfieldUsernameHint,
                        errorText: (state.showPhoneNumberError)
                            ? S.current
                                .verificationCodePageTextfieldUsernameError
                            : null,
                        prefixIcon: Icon(Icons.person),
                      ),
                      onChanged: (username) => verificationCodeFormBloc.add(
                        VerificationCodeFormEvent.updateUsername(
                          username,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(),
                labelText: S.current.verificationCodePageTextfieldCodeLabel,
                hintText: S.current.verificationCodePageTextfieldCodeHint,
                errorText: (state.showCodeError)
                    ? S.current.verificationCodePageTextfieldCodeError
                    : null,
              ),
              onChanged: (code) => verificationCodeFormBloc.add(
                VerificationCodeFormEvent.updateVerificationCode(
                  code,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextButton(
                onPressed: () {
                  _onResendButtonClicked(context);
                },
                child: RichText(
                  text: TextSpan(
                    text: S.current.verificationCodePageResendCodeButtonLabel,
                    style: TextStyle(
                      color: colorScheme.secondary,
                    ),
                    children: [
                      TextSpan(
                        text: S
                            .current.verificationCodePageResendCodeButtonLabel2,
                        style: TextStyle(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ElevatedButton(
                onPressed: () {
                  _onVerificationButtonClicked(context);
                },
                child: Builder(
                  builder: (context) {
                    if (state.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Text(
                      S.current.verificationCodePageButtonLabel,
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _onVerificationButtonClicked(BuildContext context) {
    final verificationCodeFormBloc = context.read<VerificationCodeFormBloc>();
    final state = verificationCodeFormBloc.state;
    if (!state.isFormValid) {
      verificationCodeFormBloc.add(
        VerificationCodeFormEvent.validateFields(),
      );
      return;
    }
    if (verificationType == VerificationType.email) {
      verificationCodeFormBloc.add(
        VerificationCodeFormEvent.verifyByEmail(),
      );
    } else {
      verificationCodeFormBloc.add(
        VerificationCodeFormEvent.verifyByPhone(),
      );
    }
  }

  void _onResendButtonClicked(BuildContext context) {
    final verificationCodeFormBloc = context.read<VerificationCodeFormBloc>();
    final state = verificationCodeFormBloc.state;
    if (!state.isPhoneNumberValid) {
      verificationCodeFormBloc.add(
        VerificationCodeFormEvent.updateUsername(''),
      );
      return;
    }
    verificationCodeFormBloc.add(
      VerificationCodeFormEvent.resend(),
    );
    KordiFlushbar(
      message: S.current.verificationCodePageFlushbarLabel,
      maxWidth: 120,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
    ).show(context);
  }
}
