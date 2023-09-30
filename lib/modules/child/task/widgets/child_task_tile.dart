import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/global/models/task.dart';
import 'package:fun_nance_rewritten/global/providers/time_provider.dart';
import 'package:fun_nance_rewritten/global/utils/form_util.dart';

class ChildTaskTile extends ConsumerWidget {
  final Task task;

  const ChildTaskTile({super.key, required this.task,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeNow = ref.watch(timeProvider);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        splashColor: task.statusColor.withOpacity(0.1),
        onTap: () {
          showChildTaskDetail(context, task);
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: task.statusColor),
            color: Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Berakhir dalam ${task.deadline.difference(timeNow).inHours} jam",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Container(
                height: 22,
                width: 64,
                decoration: BoxDecoration(
                  color: task.statusColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(3),
                  ),
                ),
                child: Center(
                  child: Text(
                    task.statusName,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
