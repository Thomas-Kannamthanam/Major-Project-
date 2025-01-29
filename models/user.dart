// lib/models/user.dart
class User {
  String name;
  String phoneNumber;

  User({required this.name, required this.phoneNumber});

  // Convert a User into a Map. The keys must correspond to the names of the fields.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }

  // Extract a User object from a Map.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      phoneNumber: map['phoneNumber'],
    );
  }
}