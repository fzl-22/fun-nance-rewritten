import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/global/models/child.dart';
import 'package:fun_nance_rewritten/global/providers/child_provider.dart';
import 'package:fun_nance_rewritten/modules/parent/child/forms/add_child_form.dart';

void showAddChildForm(BuildContext context, WidgetRef ref) async {
  final newChild = await showModalBottomSheet<Child>(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return const AddChildForm();
    },
  );

  if (newChild == null) {
    return;
  }

  ref.read(childListProvider.notifier).addChild(newChild);
}
