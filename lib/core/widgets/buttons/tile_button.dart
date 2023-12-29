import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/core/themes/color_theme.dart';

class TileButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const TileButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: ColorTheme.mainLighterOrange,
        ),
      ),
      tileColor: const Color(0xFFFFEDBF),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 10,
      ),
      horizontalTitleGap: 24,
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 21.5,
          backgroundColor: Colors.white,
          foregroundColor: ColorTheme.mainLighterOrange,
          child: const Icon(Icons.add),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
      ),
      onTap: onTap,
    );
  }
}
