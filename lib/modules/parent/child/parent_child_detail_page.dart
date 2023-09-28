import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/models/child.dart';
import 'package:fun_nance_rewritten/global/themes/color_theme.dart';
import 'package:fun_nance_rewritten/modules/parent/child/forms/edit_child_form.dart';
import 'package:fun_nance_rewritten/modules/parent/child/widgets/child_summary_card.dart';
import 'package:fun_nance_rewritten/modules/parent/sections/parent_header_section.dart';
import 'package:iconly/iconly.dart';

class ParentChildDetailPage extends StatelessWidget {
  final Child child;

  const ParentChildDetailPage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorTheme().warmGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              IconlyLight.arrow_left_2,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ParentHeaderSection(
                parentName: "Mochamad Andi Divangga",
                description: "Yuk lihat perkembangan dari ${child.fullName}",
              ),
              const SizedBox(height: 24),
              ChildSummaryCard(child: child),
              const SizedBox(height: 24),
              EditChildForm(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
