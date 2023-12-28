import 'package:fun_nance_rewritten/core/utils/uuid_util.dart';

class Parent {
  late String id;
  late String fullName;
  late String email;
  late String password;
  late DateTime createdAt;
  late DateTime updatedAt;

  Parent({required this.fullName, required this.email, required this.password})
      : id = uuid.v4(),
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'password': password,
      'createdAt': createdAt.toLocal().toString(),
      'updatedAt': updatedAt.toLocal().toString(),
    };
  }
}
