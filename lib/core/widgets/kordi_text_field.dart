import 'package:flutter/material.dart';

class KordiTextField extends StatefulWidget {
  const KordiTextField({
    required this.labelText,
    required this.hintText,
    required this.shouldShowErrorText,
    required this.errorText,
    required this.onChanged,
    this.prefixIcon,
    this.obscureNeeded = false,
    this.keyboardType,
    this.maxLength,
    this.textAlign = TextAlign.start,
  });

  final String labelText;
  final String hintText;
  final bool shouldShowErrorText;
  final String errorText;
  final void Function(String) onChanged;
  final Widget? prefixIcon;
  final bool obscureNeeded;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextAlign textAlign;

  @override
  State<KordiTextField> createState() => _KordiTextFieldState();
}

class _KordiTextFieldState extends State<KordiTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureNeeded ? isObscure : false,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      textAlign: widget.textAlign,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        labelText: widget.labelText,
        hintText: widget.hintText,
        errorText: widget.shouldShowErrorText ? widget.errorText : null,
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(),
        suffixIcon: Builder(
          builder: (context) {
            if (!widget.obscureNeeded) {
              return const SizedBox();
            }
            return IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: Builder(
                builder: (context) {
                  if (isObscure) {
                    return Icon(
                      Icons.visibility,
                    );
                  } else {
                    return Icon(
                      Icons.visibility_off,
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
