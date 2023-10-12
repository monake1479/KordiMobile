import 'dart:developer';

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/collections/pages/collection_page.dart';
import 'package:kordi_mobile/core/controllers/localization_bloc.dart';
import 'package:kordi_mobile/core/pages/about_page.dart';
import 'package:kordi_mobile/core/pages/kordi_scaffold.dart';
import 'package:kordi_mobile/l10n/l10n.dart';
import 'package:kordi_mobile/sign_up/pages/sign_up_page.dart';

class KordiDrawer extends StatelessWidget {
  const KordiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Builder(
      builder: (outerContext) {
        return Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  'dante' != null
                      ? context.l10n.drawerUserGreetings('dante')
                      : context.l10n.drawerGreetings,
                ),
                leading: CircleAvatar(
                  backgroundColor: theme.colorScheme.primary,
                  child: Icon(Icons.person),
                ),
                onTap: () {
                  log('user tap');
                },
              ),
              ListTile(
                title: Text(context.l10n.drawerSignInButtonLabel),
                leading: Icon(Icons.login),
                onTap: () {
                  // Scaffold.of(outerContext).closeDrawer();
                  // HomePageRoute().go(context);
                },
              ),
              ListTile(
                title: Text(context.l10n.drawerSignUpButtonLabel),
                leading: Icon(Icons.edit_document),
                onTap: () {
                  Scaffold.of(outerContext).closeDrawer();
                  SignUpPageRoute().go(context);
                },
              ),
              ListTile(
                title: Text(context.l10n.drawerCollectionButtonLabel),
                leading: Icon(Icons.collections_bookmark_rounded),
                onTap: () {
                  Scaffold.of(outerContext).closeDrawer();
                  CollectionPageRoute().go(context);
                },
              ),
              ListTile(
                title: Text(context.l10n.drawerAboutButtonLabel),
                leading: Icon(Icons.info),
                onTap: () {
                  Scaffold.of(outerContext).closeDrawer();
                  AboutPageRoute().go(context);
                },
              ),
              ListTile(
                title: Text(context.l10n.drawerChangeLanguageButtonLabel),
                leading: Flag.fromCode(
                  context.read<LocalizationBloc>().currentFlagCode,
                  width: 20,
                ),
                onTap: () => context.read<LocalizationBloc>().add(
                      LocalizationEvent.changeLocale(),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
