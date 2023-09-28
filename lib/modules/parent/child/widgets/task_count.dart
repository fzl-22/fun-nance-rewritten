import 'package:flutter/material.dart';

class TaskCount extends StatelessWidget {
  final String taskLabel;
  final int taskCount;
  final Color taskColor;

  const TaskCount({
    super.key,
    required this.taskLabel,
    required this.taskCount,
    required this.taskColor,
  });

  TextStyle _numberTextStyle(BuildContext context, Color color) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: color,
        );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 79,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$taskCount",
            style: _numberTextStyle(
              context,
              taskColor,
            ),
          ),
          Text(
            taskLabel,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
