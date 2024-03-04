import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/collection_comments/controllers/manage_collection_comments/manage_collection_comments_cubit.dart';
import 'package:kordi_mobile/collection_comments/models/comment.dart';
import 'package:kordi_mobile/core/models/kordi_exception.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/core/utils/kordi_dialog.dart';
import 'package:kordi_mobile/gen/l10n.dart';
import 'package:kordi_mobile/user/controllers/get_user_cubit.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({super.key, required this.comment});
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final username = context.read<GetUserCubit>().state.user?.username ?? '';
    final collectionIdString =
        GoRouterState.of(context).pathParameters['collectionId'];

    if (collectionIdString == null) {
      KordiDialog.showException(
        context,
        KordiException.customMessage(
          message: S.current.navigationExceptionMessage,
        ),
      );
      CollectionPageRoute().go(context);
    }
    final collectionId = int.parse(collectionIdString!);
    return Card(
      color: colorScheme.onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: theme.colorScheme.primary,
                    child: Icon(Icons.person),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.username ?? '',
                      style: textTheme.bodyLarge,
                    ),
                    Text(
                      comment.createdTimeFormatted,
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
                Spacer(),
                Builder(
                  builder: (context) {
                    if (comment.isOwner(username)) {
                      return IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          await context
                              .read<ManageCollectionCommentsCubit>()
                              .delete(collectionId, comment.id);
                        },
                        icon: BlocBuilder<ManageCollectionCommentsCubit,
                            ManageCollectionCommentsState>(
                          builder: (context, state) {
                            if (state.isLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Icon(
                              Icons.delete,
                              color: colorScheme.error,
                            );
                          },
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
            Flexible(
              child: Text(
                comment.content,
                style: textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
