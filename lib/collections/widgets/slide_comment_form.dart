part of 'package:kordi_mobile/collections/pages/collection_details_page.dart';

class _SlideCommentForm extends StatefulWidget {
  const _SlideCommentForm();

  @override
  State<_SlideCommentForm> createState() => _SlideCommentFormState();
}

class _SlideCommentFormState extends State<_SlideCommentForm>
    with SingleTickerProviderStateMixin {
  final _keyShakeError = GlobalKey<ShakeErrorState>();

  late final TextEditingController _textEditingController;
  late final AnimationController _animationController;
  bool _isError = false;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  void slide() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
      return;
    }
    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    if (_animationController.status == AnimationStatus.dismissed) {
      return const SizedBox.shrink();
    }

    return SizeTransition(
      sizeFactor: _animationController,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ShakeError(
              key: _keyShakeError,
              child: TextFormField(
                controller: _textEditingController,
                minLines: 1,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: S.current.collectionDetailsCommentListFormHintText,
                  errorText: _isError
                      ? S.current.collectionDetailsCommentListFormErrorText
                      : null,
                ),
                onChanged: (value) {
                  setState(() => _isError = false);
                },
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              await _onSendButtonOnPressed(context);
            },
            icon: BlocBuilder<ManageCollectionCommentsCubit,
                ManageCollectionCommentsState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return Center(child: const CircularProgressIndicator());
                }
                return Icon(
                  Icons.send,
                  color: colorScheme.primary,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onSendButtonOnPressed(
    BuildContext context,
  ) async {
    if (_textEditingController.text.isEmpty) {
      _keyShakeError.currentState?.shake();
      setState(() => _isError = true);
      return;
    }
    final user = context.read<GetUserCubit>().state.user;
    if (user == null) {
      await KordiDialog.showException(
        context,
        KordiException.customMessage(
          message: S.current.userInformationExceptionMessage,
        ),
      );
      CollectionPageRoute().go(context);
      return;
    }
    await context.read<ManageCollectionCommentsCubit>().create(
          _textEditingController.text,
          user,
        );
    _textEditingController.clear();
  }

  @override
  void dispose() {
    _animationController.removeListener(() {
      setState(() {});
    });
    _animationController.dispose();
    super.dispose();
  }
}
