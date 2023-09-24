import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/themes/color_theme.dart';
import 'package:icons_plus/icons_plus.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const GoogleButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(
          color: ColorTheme().mainDarkerOrange,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: ColorTheme().mainDarkerOrange,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maximumSize: const Size.fromWidth(256)),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Logo(
              Logos.google,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
