import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/themes/color_theme.dart';
import 'package:fun_nance_rewritten/modules/parent/sections/parent_header_section.dart';
import 'package:fun_nance_rewritten/modules/parent/task/sections/parent_body_task_section.dart';
import 'package:fun_nance_rewritten/modules/parent/task/widgets/all_child_summary_card.dart';

class ParentTaskPage extends StatelessWidget {
  const ParentTaskPage({super.key});

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
              description: "Yuk lihat kemajuan tugas dari anakmu",
            ),
            SizedBox(height: 24),
            AllChildSummaryCard(),
            SizedBox(height: 24),
            ParentBodyTaskSection(),
          ],
        ),
      ),
    );
  }
}
