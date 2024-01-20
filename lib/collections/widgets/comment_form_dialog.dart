import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kordi_mobile/core/widgets/shake_error.dart';
import 'package:kordi_mobile/gen/l10n.dart';

class CommentFormDialog extends StatefulWidget {
  const CommentFormDialog({super.key, required this.collectionId});
  final int collectionId;

  static Future<String?> show(
    BuildContext context,
    int collectionId,
  ) async {
    return showAdaptiveDialog<String?>(
      context: context,
      barrierDismissible: false,
      builder: (context) => CommentFormDialog(
        collectionId: collectionId,
      ),
    );
  }

  @override
  State<CommentFormDialog> createState() => _CommentFormDialogState();
}

class _CommentFormDialogState extends State<CommentFormDialog> {
  late final TextEditingController _textEditingController;
  final _keyShakeError = GlobalKey<ShakeErrorState>();
  bool _isError = false;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AlertDialog.adaptive(
      contentPadding: const EdgeInsets.all(8),
      surfaceTintColor: colorScheme.surface,
      content: Material(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShakeError(
                key: _keyShakeError,
                child: TextFormField(
                  controller: _textEditingController,
                  minLines: 2,
                  maxLines: 6,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        S.current.collectionDetailsCommentListFormHintText,
                    errorText: _isError
                        ? S.current.collectionDetailsCommentListFormErrorText
                        : null,
                  ),
                  onChanged: (value) {
                    setState(() => _isError = false);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      title: Text(
        S.current.collectionDetailsCommentDialogTitle,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(S.current.filterDialogCloseButtonLabel),
        ),
        TextButton(
          onPressed: () async {
            await _onSendButtonOnPressed(context);
          },
          child: Text(S.current.filterDialogApplyButtonLabel),
        ),
      ],
    );
  }

  Future<void> _onSendButtonOnPressed(
    BuildContext context,
  ) async {
    if (_textEditingController.text.isEmpty) {
      _keyShakeError.currentState?.shake();
      return;
    }
    context.pop(_textEditingController.text);
    _textEditingController.clear();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
