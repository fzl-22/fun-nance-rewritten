import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:fun_nance_rewritten/core/themes/color_theme.dart';
import 'package:fun_nance_rewritten/features/child/reward/sections/child_body_reward_section.dart';
import 'package:fun_nance_rewritten/features/child/reward/widgets/balance_card.dart';

class ChildRewardPage extends StatelessWidget {
  const ChildRewardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: ColorTheme.warmGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ProfilePicture(
                  name: "Ahmad Mu'min Faisal",
                  radius: 24,
                  fontsize: 16,
                  count: 2,
                ),
                const SizedBox(width: 12),
                Text(
                  "Hi, Ahmad",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: const BalanceCard(amount: 500),
            ),
            const SizedBox(height: 24),
            const ChildBodyRewardSection(),
            // SizedBox(height: 24),
            // ChildBodyTaskSection(),
          ],
        ),
      ),
    );
  }
}
