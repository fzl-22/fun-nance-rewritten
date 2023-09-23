
import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/themes/color_theme.dart';

class HighlightedTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;

  const HighlightedTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.name,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorTheme().mainGrey,
            width: 2,
          )
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorTheme().mainDarkerOrange,
            width: 2,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ColorTheme().mainGrey,
        ),
        
      ),
      obscureText: obscureText,
    );
  }
}
