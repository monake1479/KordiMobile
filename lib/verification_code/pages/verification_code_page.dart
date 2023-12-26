import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/core/utils/kordi_flushbar.dart';
import 'package:kordi_mobile/core/widgets/kordi_text_field.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';
import 'package:kordi_mobile/gen/l10n.dart';

import 'package:kordi_mobile/sign_up/models/verification_type.dart';
import 'package:kordi_mobile/verification_code/controllers/verification_code_controllers.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({
    required this.verificationType,
    super.key,
  });
  final VerificationType verificationType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider<VerificationCodeBloc>(
          create: (context) => getIt.get<VerificationCodeBloc>(),
        ),
        BlocProvider<VerificationCodeFormBloc>(
          create: (context) => getIt.get<VerificationCodeFormBloc>()
            ..add(
              VerificationCodeFormEvent.updateVerificationType(
                verificationType,
              ),
            ),
        ),
      ],
      child: BlocListener<VerificationCodeBloc, VerificationCodeState>(
        listener: (context, state) {
          if (state.isSuccess) {
            KordiDialog.show(
              context,
              title: S.current.verificationCodePageSuccessDialogTitle,
              subtitle: S.current.verificationCodePageSuccessDialogSubtitle,
              buttonLabel:
                  S.current.verificationCodePageSuccessDialogButtonLabel,
              onButtonOnPressed: () {
                SignInPageRoute().go(context);
              },
            );
            return;
          }
          if (state.exception != null) {
            KordiDialog.showException(
              context,
              state.exception!,
            );
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Assets.icons.logo.image(
                      width: 38,
                    ),
                  ),
                  Text(
                    'KORDI Mobile',
                    style: TextStyle(color: colorScheme.secondary),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.info_outline_rounded),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: colorScheme.primaryContainer,
                        ),
                        height: MediaQuery.of(context).size.height * 0.55,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.current.verificationCodePageTitle,
                              style: textTheme.headlineLarge,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                children: [
                                  Assets.images.authentication.svg(
                                    width: MediaQuery.of(context).size.width *
                                        0.28,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        S.current
                                            .verificationCodePageDescription,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            BlocBuilder<VerificationCodeFormBloc,
                                VerificationCodeFormState>(
                              builder: (context, state) {
                                final verificationCodeFormBloc =
                                    context.read<VerificationCodeFormBloc>();
                                return Column(
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (verificationType ==
                                            VerificationType.phoneNumber) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8,
                                            ),
                                            child: KordiTextField(
                                              labelText: S.current
                                                  .verificationCodePageTextfieldUsernameLabel,
                                              hintText: S.current
                                                  .verificationCodePageTextfieldUsernameHint,
                                              shouldShowErrorText:
                                                  state.showPhoneNumberError,
                                              errorText: S.current
                                                  .verificationCodePageTextfieldUsernameError,
                                              prefixIcon: Icon(Icons.person),
                                              onChanged: (username) =>
                                                  verificationCodeFormBloc.add(
                                                VerificationCodeFormEvent
                                                    .updateUsername(
                                                  username,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        return const SizedBox();
                                      },
                                    ),
                                    KordiTextField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      maxLength: 6,
                                      labelText: S.current
                                          .verificationCodePageTextfieldCodeLabel,
                                      hintText: S.current
                                          .verificationCodePageTextfieldCodeHint,
                                      shouldShowErrorText: state.showCodeError,
                                      errorText: S.current
                                          .verificationCodePageTextfieldCodeError,
                                      onChanged: (code) =>
                                          verificationCodeFormBloc.add(
                                        VerificationCodeFormEvent
                                            .updateVerificationCode(
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
                                            text: S.current
                                                .verificationCodePageResendCodeButtonLabel,
                                            style: TextStyle(
                                              color: colorScheme.secondary,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: S.current
                                                    .verificationCodePageResendCodeButtonLabel2,
                                                style: TextStyle(
                                                  color: colorScheme.secondary,
                                                  fontWeight: FontWeight.bold,
                                                  decoration:
                                                      TextDecoration.underline,
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
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return Text(
                                              S.current
                                                  .verificationCodePageButtonLabel,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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
    ).show(context);
  }
}
