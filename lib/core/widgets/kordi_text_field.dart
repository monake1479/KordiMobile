import 'package:flutter/material.dart';

class KordiTextField extends StatefulWidget {
  const KordiTextField({
    required this.labelText,
    required this.hintText,
    required this.shouldShowErrorText,
    required this.errorText,
    required this.prefixIcon,
    required this.onChanged,
    this.obscureNeeded = false,
  });
  final String labelText;
  final String hintText;
  final bool shouldShowErrorText;
  final String errorText;
  final Widget prefixIcon;
  final void Function(String) onChanged;
  final bool obscureNeeded;

  @override
  State<KordiTextField> createState() => _KordiTextFieldState();
}

class _KordiTextFieldState extends State<KordiTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureNeeded ? isObscure : false,
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
