import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/global/providers/child_provider.dart';
import 'package:fun_nance_rewritten/global/providers/task_provider.dart';
import 'package:fun_nance_rewritten/global/utils/form_util.dart';
import 'package:fun_nance_rewritten/global/widgets/buttons/tile_button.dart';
import 'package:fun_nance_rewritten/modules/parent/task/widgets/parent_task_tile.dart';

class ParentBodyTaskSection extends ConsumerWidget {
  const ParentBodyTaskSection({super.key});

  String _getFirstName(String name) {
    return name.split(" ").first;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);
    final childList = ref.watch(childListProvider).where(
          (child) => child.fullName != "Semua",
        ).toList();

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
              TileButton(
                title: "Tambahkan Tugas",
                subtitle: "Total semua tugas: ${taskList.length}",
                onTap: () {
                  showAddTaskForm(context, ref);
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(0),
                  itemCount: childList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tugas ${_getFirstName(childList[index].fullName)}",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const SizedBox(height: 10),
                        ...taskList
                            .where((task) =>
                                task.childName == childList[index].fullName)
                            .map((task) => ParentTaskTile(task: task))
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
