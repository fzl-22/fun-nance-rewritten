import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/core/themes/color_theme.dart';
import 'package:fun_nance_rewritten/features/parent/child/sections/parent_body_child_section.dart';
import 'package:fun_nance_rewritten/features/parent/sections/parent_header_section.dart';

class ParentChildPage extends StatelessWidget {
  const ParentChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: ColorTheme().warmGradient,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24),
            ParentHeaderSection(
              parentName: "Mochamad Andi Divangga",
              description: "Yuk lihat perkembangan dari anakmu",
            ),
            SizedBox(height: 24),
            ParentBodyChildSection(),
          ],
        ),
      ),
    );
  }
}
