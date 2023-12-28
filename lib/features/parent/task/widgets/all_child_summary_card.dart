import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/models/task.dart';
import 'package:fun_nance_rewritten/core/providers/child_provider.dart';
import 'package:fun_nance_rewritten/core/providers/time_provider.dart';
import 'package:fun_nance_rewritten/features/parent/child/widgets/task_count.dart';

class AllChildSummaryCard extends ConsumerWidget {
  const AllChildSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                "Kemajuan Tugas Anak",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 6),
              Text(
                ref.watch(timeProvider).toLocal().toString().split(" ")[0].replaceAll("-", "/"),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TaskCount(
                    taskLabel: "Tugas Telah Dikerjakan",
                    taskCount: ref.watch(childListProvider).fold<int>(0, (sum, child) => sum + child.taskDone),
                    taskColor: taskStatusObject[TaskStatus.done]!['color'],
                  ),
                  TaskCount(
                    taskLabel: "Tugas Belum Dikerjakan",
                    taskCount: ref.watch(childListProvider).fold<int>(0, (sum, child) => sum + child.taskReviewed),
                    taskColor: taskStatusObject[TaskStatus.notYet]!['color'],
                  ),
                  TaskCount(
                    taskLabel: "Tugas Belum Disetujui",
                    taskCount: ref.watch(childListProvider).fold<int>(0, (sum, child) => sum + child.taskRejected),
                    taskColor: taskStatusObject[TaskStatus.pending]!['color'],
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