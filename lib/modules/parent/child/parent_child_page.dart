import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/themes/color_theme.dart';
import 'package:fun_nance_rewritten/modules/parent/child/sections/body_child_section.dart';
import 'package:fun_nance_rewritten/modules/parent/sections/parent_header_section.dart';

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
            BodyChildSection(),
          ],
        ),
      ),
    );
  }
}
