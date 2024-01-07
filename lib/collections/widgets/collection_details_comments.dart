part of 'package:kordi_mobile/collections/pages/collection_details_page.dart';

class _CollectionDetailsComments extends StatefulWidget {
  const _CollectionDetailsComments();

  @override
  State<_CollectionDetailsComments> createState() =>
      _CollectionDetailsCommentsState();
}

class _CollectionDetailsCommentsState
    extends State<_CollectionDetailsComments> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final collectionIdString =
        GoRouterState.of(context).pathParameters['collectionId'];
    if (collectionIdString == null) {
      KordiDialog.showException(
        context,
        KordiException.customMessage(
          message: 'Something went wrong with navigation.',
        ),
      );
      CollectionPageRoute().go(context);
    }
    final collectionId = int.parse(collectionIdString!);
    final _slideCommentFormKey = GlobalKey<_SlideCommentFormState>();
    final authState = context.read<AuthCubit>().state;

    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) =>
            getIt.get<ManageCollectionCommentsCubit>()..get(collectionId),
        child: Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.comment,
                        color: colorScheme.primary,
                      ),
                    ),
                    Text(
                      S.current.collectionDetailsCommentListTitle,
                      style: textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                    Spacer(),
                    Builder(
                      builder: (context) {
                        if (authState.isAuthorized) {
                          return TextButton(
                            onPressed: () {
                              _slideCommentFormKey.currentState?.slide();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: colorScheme.primary,
                                ),
                                Text(
                                  S.current
                                      .collectionDetailsCommentListAddButtonLabel,
                                ),
                              ],
                            ),
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
                Builder(
                  builder: (context) {
                    if (authState.isAuthorized) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        S.current.collectionDetailsCommentListUnauthorizedState,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          decoration: TextDecoration.underline,
                          color: colorScheme.tertiary,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    );
                  },
                ),
                _SlideCommentForm(
                  key: _slideCommentFormKey,
                ),
                BlocConsumer<ManageCollectionCommentsCubit,
                    ManageCollectionCommentsState>(
                  listener: (context, state) async {
                    if (state.exception != null) {
                      await KordiDialog.showException(
                        context,
                        state.exception!,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state.comments.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          S.current.collectionDetailsCommentListEmptyState,
                          style: textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    return SizedBox(
                      height: 400,
                      child: RawScrollbar(
                        controller: _scrollController,
                        thumbColor: colorScheme.primary,
                        padding: EdgeInsets.zero,
                        mainAxisMargin: 6,
                        radius: Radius.circular(8),
                        thumbVisibility: true,
                        child: ListView.builder(
                          controller: _scrollController,
                          padding: EdgeInsets.zero,
                          itemCount: state.comments.length,
                          itemBuilder: (context, index) {
                            final comment = state.comments[index];
                            return CommentTile(
                              comment: comment,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
