import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/auth/controllers/auth_cubit.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/get_collections/get_collections_cubit.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/core/widgets/kordi_drawer.dart';
import 'package:kordi_mobile/core/widgets/kordi_search_button.dart';
import 'package:kordi_mobile/dependency_injection.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';
import 'package:kordi_mobile/gen/l10n.dart';

class KordiScaffold extends StatelessWidget {
  const KordiScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetCollectionsCubit>(
          create: (context) => getIt.get<GetCollectionsCubit>(),
        ),
        BlocProvider<CollectionsFilterBloc>(
          create: (context) => getIt.get<CollectionsFilterBloc>()
            ..add(CollectionsFilterEvent.getCollections()),
        ),
      ],
      child: Scaffold(
        backgroundColor: colorScheme.background,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
          centerTitle: false,
          leadingWidth: 30,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: colorScheme.primary,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: GestureDetector(
                  onTap: () => CollectionPageRoute().go(context),
                  child: Assets.icons.logo.image(
                    width: 38,
                  ),
                ),
              ),
              Text(
                S.current.kordiScaffoldTitle,
                style: TextStyle(color: colorScheme.secondary),
              ),
            ],
          ),
          actions: [
            KordiSearchButton(),
          ],
        ),
        drawer: KordiDrawer(),
        floatingActionButton: Builder(
          builder: (context) {
            final authState = context.read<AuthCubit>().state;
            if (authState is Authorized &&
                GoRouterState.of(context).fullPath == '/collection') {
              return FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  CreateCollectionFirstStepRoute().go(
                    context,
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
        body: child,
      ),
    );
  }
}
