import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/l10n/l10n.dart';
import 'package:kordi_mobile/resources/resources.dart';
import 'package:kordi_mobile/verification_code/controllers/verification_code_bloc.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final TextEditingController _controller = TextEditingController();

    return BlocProvider(
      create: (context) => getIt.get<VerificationCodeBloc>(),
      child: BlocBuilder<VerificationCodeBloc, VerificationCodeState>(
        builder: (context, state) {
          final verificationCodeBloc = context.read<VerificationCodeBloc>();
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Image(
                      image: AssetImage(KordiIcons.logo),
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
                  onPressed: () {
                    log('Help!');
                  },
                  icon: Icon(Icons.info_outline_rounded),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: colorScheme.primaryContainer,
                    ),
                    height: MediaQuery.of(context).size.height * 0.5,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.verificationCodePageTitle,
                          style: textTheme.headlineLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                KordiImages.authentication,
                                width: MediaQuery.of(context).size.width * 0.28,
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    context
                                        .l10n.verificationCodePageDescription,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: _controller,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8),
                            labelText:
                                context.l10n.verificationCodePageLabelTextField,
                            hintText:
                                context.l10n.verificationCodePageHintTextField,
                            // errorText: state.showUsernameError
                            //     ? context.l10n.signUpPageUsernameErrorTextField
                            //     : null,

                            border: OutlineInputBorder(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_controller.text.isNotEmpty &&
                                  _controller.text.length == 6) {
                                log('controller text is not empty');
                                verificationCodeBloc.add(
                                  VerificationCodeEvent.verify(
                                    _controller.text,
                                    // @@@ MISSING USERNAME
                                    'username',
                                  ),
                                );
                              } else {
                                log('controller text is empty');
                              }
                            },
                            child: Text(
                              context.l10n.verificationCodePageButtonLabel,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
