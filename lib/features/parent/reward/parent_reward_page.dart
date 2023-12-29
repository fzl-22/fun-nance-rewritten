import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/providers/parent_provider.dart';
import 'package:fun_nance_rewritten/core/themes/color_theme.dart';
import 'package:fun_nance_rewritten/features/parent/reward/sections/parent_body_reward_section.dart';
import 'package:fun_nance_rewritten/features/parent/sections/parent_header_section.dart';

class ParentRewardPage extends ConsumerWidget {
  const ParentRewardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: ColorTheme.warmGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            ParentHeaderSection(
              parentName: ref.read(parentProvider.notifier).parent!.fullName,
              description: "Yuk lihat perkembangan dari anakmu",
            ),
            const SizedBox(height: 24),
            const ParentBodyRewardSection(),
          ],
        ),
      ),
    );
  }
}
