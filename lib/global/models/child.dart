import 'package:fun_nance_rewritten/global/utils/uuid_util.dart';

class Child extends Object {
  late String id;
  late String fullName;
  late String password;
  late int taskDone;
  late int taskRejected;
  late int taskReviewed;
  late int taskLate;
  late DateTime createdAt;
  late DateTime updatedAt;

  Child({
    required this.fullName,
    required this.password,
    this.taskDone = 0,
    this.taskRejected = 0,
    this.taskReviewed = 0,
    this.taskLate = 0,
  })  : id = uuid.v4(),
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();
}
