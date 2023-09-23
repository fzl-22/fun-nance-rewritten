import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/themes/color_theme.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.zero,
            foregroundColor: ColorTheme().mainLighterOrange,
            alignment: Alignment.centerRight,
            textStyle: Theme.of(context).textTheme.bodyLarge,
          ),
          onPressed: () {},
          child: const Text("lupa password?"),
        ),
      ],
    );
  }
}
