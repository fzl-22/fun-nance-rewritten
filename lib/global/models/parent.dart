import 'package:fun_nance_rewritten/global/utils/uuid_util.dart';

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
}
