import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/global/models/child.dart';
import 'package:fun_nance_rewritten/global/models/reward.dart';
import 'package:fun_nance_rewritten/global/models/task.dart';
import 'package:fun_nance_rewritten/global/providers/child_provider.dart';
import 'package:fun_nance_rewritten/global/providers/reward_provider.dart';
import 'package:fun_nance_rewritten/global/providers/task_provider.dart';
import 'package:fun_nance_rewritten/modules/child/task/widgets/child_task_detail.dart';
import 'package:fun_nance_rewritten/modules/parent/child/forms/add_child_form.dart';
import 'package:fun_nance_rewritten/modules/parent/reward/forms/add_reward_form.dart';
import 'package:fun_nance_rewritten/modules/parent/task/forms/add_task_form.dart';

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

void showAddRewardForm(BuildContext context, WidgetRef ref) async {
  final newReward = await showModalBottomSheet<Reward>(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return const AddRewardForm();
    },
  );

  if (newReward == null) {
    return;
  }

  print("IN BODY REWARD===================");
  print(newReward.childName);
  print(newReward.title);

  ref.watch(rewardListProvider.notifier).addReward(newReward);
}

void showAddTaskForm(BuildContext context, WidgetRef ref) async {
  final newTask = await showModalBottomSheet<Task>(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    builder: (context) {
      return const AddTaskForm();
    },
  );

  if (newTask == null) {
    return;
  }
  print(newTask.title);
  print(newTask.childName);
  ref.watch(taskListProvider.notifier).addTask(newTask);
}

void showChildTaskDetail(
    BuildContext context,
    Task task,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ChildTaskDetail(task: task);
      },
    );
  }