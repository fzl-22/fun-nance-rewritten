import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/global/models/task.dart';

class ParentTaskTile extends ConsumerWidget {
  final Task task;

  const ParentTaskTile({super.key, required this.task,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        splashColor: task.statusColor.withOpacity(0.1),
        onTap: () {
          // _showTaskDetail(context, ref);
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
                    "*klik untuk lihat detail atau edit",
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
