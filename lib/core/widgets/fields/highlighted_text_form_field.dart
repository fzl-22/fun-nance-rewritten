import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/core/themes/color_theme.dart';
import 'package:iconly/iconly.dart';

class HighlightedTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isPassword;

  const HighlightedTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.name,
    this.obscureText = false,
    this.isPassword = false,
  });

  @override
  State<HighlightedTextFormField> createState() =>
      _HighlightedTextFormFieldState();
}

class _HighlightedTextFormFieldState extends State<HighlightedTextFormField> {
  bool isVisible = false;

  bool get obscureTextValue {
    if (widget.obscureText == true && isVisible == true) {
      return false;
    } else if (widget.obscureText == true && isVisible == false) {
      return true;
    } else if (widget.obscureText == false && isVisible == true) {
      return false;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Icon(
                  isVisible ? IconlyBold.show : IconlyBold.hide,
                  size: 24,
                  color: ColorTheme().mainLighterOrange,
                ),
              )
            : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorTheme().mainGrey,
            width: 2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorTheme().mainDarkerOrange,
            width: 2,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ColorTheme().mainGrey,
        ),
      ),
      controller: widget.controller,
      obscureText: obscureTextValue,
    );
  }
}
