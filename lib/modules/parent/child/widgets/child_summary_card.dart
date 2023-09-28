import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/global/models/child.dart';
import 'package:fun_nance_rewritten/global/models/task.dart';
import 'package:fun_nance_rewritten/global/providers/time_provider.dart';
import 'package:fun_nance_rewritten/modules/parent/child/widgets/task_count.dart';


class ChildSummaryCard extends ConsumerWidget {
  const ChildSummaryCard({
    super.key,
    required this.child,
  });

  final Child child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeProvider);

    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                "Rangkuman Tugas Anak",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 6),
              Text(
                  "${time.subtract(const Duration(days: 7)).toLocal().toString().split(" ")[0].split("-").join("/")} - ${time.toLocal().toString().split(" ")[0].split("-").join("/")}"),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TaskCount(
                    taskLabel: "Tugas Selesai",
                    taskCount: child.taskDone,
                    taskColor:
                        taskStatusObject[TaskStatus.done]!['color'],
                  ),
                  TaskCount(
                    taskLabel: "Tugas Ditolak",
                    taskCount: child.taskRejected,
                    taskColor:
                        taskStatusObject[TaskStatus.notYet]!['color'],
                  ),
                  TaskCount(
                    taskLabel: "Tugas Diulas",
                    taskCount: child.taskReviewed,
                    taskColor:
                        taskStatusObject[TaskStatus.pending]!['color'],
                  ),
                  TaskCount(
                    taskLabel: "Tugas Terlambat",
                    taskCount: child.taskLate,
                    taskColor: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
