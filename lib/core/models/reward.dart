import 'package:fun_nance_rewritten/core/utils/uuid_util.dart';

class Reward {
  late String id;
  late String title;
  late String childName;
  late String imageUrl;
  late int price;
  late DateTime createdAt;
  late DateTime updatedAt;

  Reward({
    required this.title,
    required this.childName,
    required this.imageUrl,
    required this.price,
  })  : id = uuid.v4(),
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'childName': childName,
      'imageUrl': imageUrl,
      'price': price,
      'createdAt': createdAt.toLocal().toString(),
      'updatedAt': updatedAt.toLocal().toString(),
    };
  }
}
