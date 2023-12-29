import 'package:flutter/material.dart';

class ShakeError extends StatefulWidget {
  const ShakeError({super.key, required this.child});
  final Widget child;

  @override
  State<ShakeError> createState() => ShakeErrorState();
}

class ShakeErrorState extends State<ShakeError>
    with SingleTickerProviderStateMixin {
  late Animation<double> _doubleAnim;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _doubleAnim = Tween(begin: -10.0, end: 10.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  void shake() {
    _animationController
        .forward(from: 0)
        .then((value) => _animationController.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_doubleAnim.value, 0),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
