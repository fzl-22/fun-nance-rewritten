import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/models/child.dart';
import 'package:fun_nance_rewritten/core/providers/parent_provider.dart';
import 'package:fun_nance_rewritten/core/themes/color_theme.dart';
import 'package:fun_nance_rewritten/features/parent/child/forms/edit_child_form.dart';
import 'package:fun_nance_rewritten/features/parent/child/widgets/child_summary_card.dart';
import 'package:fun_nance_rewritten/features/parent/sections/parent_header_section.dart';
import 'package:iconly/iconly.dart';

class ParentChildDetailPage extends ConsumerWidget {
  final Child child;

  const ParentChildDetailPage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorTheme.warmGradient,
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
                parentName: ref.read(parentProvider.notifier).parent!.fullName,
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
