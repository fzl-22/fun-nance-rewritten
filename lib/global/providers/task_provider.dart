import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/global/data/task_data.dart';
import 'package:fun_nance_rewritten/global/models/task.dart';


class TaskListNotifier extends StateNotifier<List<Task>> {
  TaskListNotifier() : super(taskData);

  void addTask(Task task) {
    state = [task, ...state];
  }

  void editTask(String title) {
    // Get the task list.
    List<Task> taskList = state;

    // Find the task with the given child name.
    Task task = taskList.firstWhere((task) => task.title == title);

    // Update the task.
    task.status = TaskStatus.done;

    // Update the task list.
    taskList[taskList.indexOf(task)] = task;

    // Set the state to the new task list.
    state = taskList;
  }

}

final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>(
  (ref) => TaskListNotifier(),
);
