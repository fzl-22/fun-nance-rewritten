import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/core/utils/uuid_util.dart';

enum TaskStatus { notYet, pending, done }

Map<TaskStatus, Map<String, dynamic>> taskStatusObject = {
  TaskStatus.notYet: {
    "name": "Not Yet",
    "color": const Color.fromARGB(255, 243, 21, 89),
  },
  TaskStatus.pending: {
    "name": "Pending",
    "color": const Color.fromARGB(255, 255, 217, 102)
  },
  TaskStatus.done: {
    "name": "Done",
    "color": const Color.fromARGB(255, 34, 166, 153)
  },
};

class Task {
  late String id;
  late String title;
  late String childName;
  late String description;
  late int reward;
  late DateTime deadline;
  late TaskStatus status;
  late DateTime createdAt;
  late DateTime updatedAt;

  Task({
    required this.title,
    required this.childName,
    required this.description,
    required this.reward,
    required this.deadline,
    required this.status,
  })  : id = uuid.v4(),
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  dynamic get statusColor => taskStatusObject[status]!["color"];

  String get statusName => taskStatusObject[status]!["name"];
}
