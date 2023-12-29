import 'package:flutter/material.dart';

class KordiTextField extends StatefulWidget {
  const KordiTextField({
    required this.labelText,
    this.onChanged,
    this.hintText,
    this.shouldShowErrorText,
    this.errorText,
    this.prefixIcon,
    this.obscureNeeded = false,
    this.keyboardType,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.suffixIcon,
    this.focusNode,
    this.controller,
    this.initialValue,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.suffixText,
  });

  final String labelText;
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool? shouldShowErrorText;
  final String? errorText;
  final Widget? prefixIcon;
  final bool obscureNeeded;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? initialValue;
  final int? maxLines;
  final bool readOnly;
  final String? suffixText;

  @override
  State<KordiTextField> createState() => _KordiTextFieldState();
}

class _KordiTextFieldState extends State<KordiTextField> {
  late TextEditingController _controller;
  bool isObscure = true;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      controller: widget.initialValue != null
          ? widget.controller
          : widget.controller ?? _controller,
      obscureText: widget.obscureNeeded ? isObscure : false,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      textAlign: widget.textAlign,
      onChanged: (value) {
        widget.onChanged?.call(value);
        setState(() {});
      },
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        suffixText: widget.suffixText,
        counterText: widget.maxLength != null
            ? '${widget.controller?.text.length ?? _controller.text.length}/${widget.maxLength}'
            : null,
        contentPadding: const EdgeInsets.all(8),
        labelText: widget.labelText,
        hintText: widget.hintText,
        errorText:
            widget.shouldShowErrorText != null && widget.shouldShowErrorText!
                ? widget.errorText
                : null,
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(),
        suffixIcon: widget.suffixIcon == null
            ? null
            : Builder(
                builder: (context) {
                  if (widget.suffixIcon != null) {
                    return widget.suffixIcon!;
                  }
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
