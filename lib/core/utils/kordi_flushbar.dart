import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class KordiFlushbar extends Flushbar {
  KordiFlushbar({
    required this.message,
    required this.maxWidth,
    super.key,
  }) : super(
          messageText: Text(
            message,
            textAlign: TextAlign.center,
          ),
          duration: const Duration(milliseconds: 1400),
          dismissDirection: FlushbarDismissDirection.VERTICAL,
          flushbarPosition: FlushbarPosition.TOP,
          isDismissible: true,
          backgroundColor: Colors.white,
          positionOffset: 25,
          borderRadius: BorderRadius.circular(12),
          maxWidth: maxWidth,
          padding: const EdgeInsets.all(10),
          animationDuration: const Duration(
            milliseconds: 200,
          ),
          boxShadows: [
            const BoxShadow(
              offset: Offset(0, 10),
              spreadRadius: -4,
              blurRadius: 19,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
          ],
        );

  @override
  final String message;
  @override
  final double maxWidth;
}
