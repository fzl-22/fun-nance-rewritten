import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/core/themes/color_theme.dart';

class AuthNavigationButton extends StatelessWidget {
  final String firstText;
  final String secondText;
  final VoidCallback onPressed;

  const AuthNavigationButton({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$firstText ",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.zero,
            foregroundColor: ColorTheme.mainDarkerOrange,
            alignment: Alignment.centerRight,
            textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          onPressed: onPressed,
          child: Text(secondText),
        ),
      ],
    );
  }
}
