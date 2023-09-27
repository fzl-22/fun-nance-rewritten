import 'package:flutter/material.dart';

class OutlinedTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String initialValue;
  final int maxLines;

  const OutlinedTextFormField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.name,
    this.initialValue = "",
    this.maxLines = 1,
  });

  @override
  State<OutlinedTextFormField> createState() => _OutlinedTextFormFieldState();
}

class _OutlinedTextFormFieldState extends State<OutlinedTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 0,
        ),
      ),
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      onChanged: (value) {
        widget.controller.text = value;
      },
      initialValue: widget.initialValue,
      maxLines: widget.maxLines,
    );
  }
}
