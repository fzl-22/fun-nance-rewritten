class Parent {
  final String id;
  final String fullName;
  final String email;
  final DateTime createdAt;
  final DateTime modifiedAt;

  const Parent({
    required this.id,
    required this.fullName,
    required this.email,
    required this.createdAt,
    required this.modifiedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'parent_id': id,
      'fullname': fullName,
      'email': email,
      'created_at': createdAt.toLocal().toString(),
      'modified_at': modifiedAt.toLocal().toString(),
    };
  }

  factory Parent.fromMap(Map<String, dynamic> map) {
    return Parent(
      id: map['parent_id'] as String,
      fullName: map['fullname'] as String,
      email: map['email'] as String,
      createdAt: DateTime.parse(map['created_at'] as String).toLocal(),
      modifiedAt: DateTime.parse(map['modified_at'] as String).toLocal(),
    );
  }
}
