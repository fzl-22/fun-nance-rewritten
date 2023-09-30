import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/global/providers/child_provider.dart';
import 'package:fun_nance_rewritten/global/providers/task_provider.dart';
import 'package:fun_nance_rewritten/modules/child/task/widgets/child_task_tile.dart';

class ChildBodyTaskSection extends ConsumerWidget {
  const ChildBodyTaskSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);
    final childList = ref
        .watch(childListProvider)
        .where(
          (child) => child.fullName == "Ahmad Mu'min Faisal",
        )
        .toList();

    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(0),
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(0),
                  itemCount: childList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Menampilkan ${taskList.length} tugas",
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        ...taskList
                            .where((task) =>
                                task.childName == childList[index].fullName)
                            .map((task) => ChildTaskTile(task: task))
                            .toList(),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
