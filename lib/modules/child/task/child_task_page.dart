import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/themes/color_theme.dart';
import 'package:fun_nance_rewritten/modules/child/sections/child_header_section.dart';
import 'package:fun_nance_rewritten/modules/child/task/sections/child_body_task_section.dart';

class ChildTaskPage extends StatelessWidget {
  const ChildTaskPage({super.key});

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
            ChildHeaderSection(
              childName: "Ahmad Mu'min Faisal",
              description: "Jangan  lupa kerjakan tugasnya yaa",
            ),
            SizedBox(height: 24),
            ChildBodyTaskSection(),
          ],
        ),
      ),
    );
  }
}
