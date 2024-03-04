import 'dart:developer';

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/auth/controllers/auth_cubit.dart';
import 'package:kordi_mobile/core/controllers/localization_bloc.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/gen/l10n.dart';

import 'package:kordi_mobile/user/controllers/get_user_cubit.dart';

class KordiDrawer extends StatelessWidget {
  const KordiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fullPath = GoRouterState.of(context).fullPath;
    return Builder(
      builder: (outerContext) {
        return Drawer(
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return BlocBuilder<GetUserCubit, GetUserState>(
                builder: (context, getUserState) {
                  return ListView(
                    children: [
                      ListTile(
                        title: Builder(
                          builder: (context) {
                            if (getUserState.user != null) {
                              return Text(
                                S.current.drawerUserGreetings(
                                  getUserState.user!.username,
                                ),
                              );
                            } else {
                              return Text(
                                S.current.drawerGreetings,
                              );
                            }
                          },
                        ),
                        leading: CircleAvatar(
                          backgroundColor: theme.colorScheme.primary,
                          child: Icon(Icons.person),
                        ),
                        onTap: () {
                          log('user tap');
                        },
                      ),
                      Builder(
                        builder: (context) {
                          if (!state.isAuthorized) {
                            return ListTile(
                              title: Text(S.current.drawerSignInButtonLabel),
                              leading: Icon(Icons.login),
                              selected: fullPath == SignInPageRoute().location,
                              selectedTileColor: theme.colorScheme.onPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              onTap: () {
                                Scaffold.of(outerContext).closeDrawer();
                                SignInPageRoute().go(context);
                              },
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      Builder(
                        builder: (context) {
                          if (!state.isAuthorized) {
                            return ListTile(
                              title: Text(S.current.drawerSignUpButtonLabel),
                              leading: Icon(Icons.edit_document),
                              selected: fullPath == SignUpPageRoute().location,
                              selectedTileColor: theme.colorScheme.onPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              onTap: () {
                                Scaffold.of(outerContext).closeDrawer();
                                SignUpPageRoute().go(context);
                              },
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      ListTile(
                        title: Text(S.current.drawerCollectionButtonLabel),
                        leading: Icon(Icons.collections_bookmark_rounded),
                        selected: fullPath == CollectionPageRoute().location,
                        selectedTileColor: theme.colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onTap: () {
                          Scaffold.of(outerContext).closeDrawer();
                          CollectionPageRoute().go(context);
                        },
                      ),
                      ListTile(
                        title: Text(S.current.drawerAboutButtonLabel),
                        leading: Icon(Icons.info),
                        selected: fullPath == AboutPageRoute().location,
                        selectedTileColor: theme.colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onTap: () {
                          Scaffold.of(outerContext).closeDrawer();
                          AboutPageRoute().go(context);
                        },
                      ),
                      Builder(
                        builder: (context) {
                          if (state.isAuthorized) {
                            return ListTile(
                              title: Text(
                                S.current.drawerChangePasswordButtonLabel,
                              ),
                              leading: Icon(Icons.lock_open),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              onTap: () {
                                Scaffold.of(outerContext).closeDrawer();
                                ChangePasswordPageRoute().go(context);
                              },
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      Builder(
                        builder: (context) {
                          if (state.isAuthorized) {
                            return ListTile(
                              title: Text(S.current.drawerSignOutButtonLabel),
                              leading: Icon(Icons.logout),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              onTap: () {
                                context.read<AuthCubit>().signOut();
                              },
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      ListTile(
                        title: Text(S.current.drawerChangeLanguageButtonLabel),
                        leading: Flag.fromCode(
                          context.read<LocalizationBloc>().currentFlagCode,
                          width: 20,
                        ),
                        onTap: () => context.read<LocalizationBloc>().add(
                              LocalizationEvent.changeLocale(),
                            ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
