import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/providers/parent_provider.dart';
import 'package:fun_nance_rewritten/core/themes/color_theme.dart';
import 'package:fun_nance_rewritten/features/parent/child/sections/parent_body_child_section.dart';
import 'package:fun_nance_rewritten/features/parent/sections/parent_header_section.dart';

class ParentChildPage extends ConsumerWidget {
  const ParentChildPage({super.key});

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
            const ParentBodyChildSection(),
          ],
        ),
      ),
    );
  }
}
