import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/themes/color_theme.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;

  const SubmitButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorTheme().orangeGradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16,),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.white,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          maximumSize: const Size.fromWidth(256)
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Icon(
              icon,
            ),
          ],
        ),
      ),
    );
  }
}
