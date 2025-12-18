class UserModel {
  final String uid;
  final String email;
  final String? name;
  final String? bloodGroup;
  final bool isDonor;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.email,
    this.name,
    this.bloodGroup,
    this.isDonor = false,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'bloodGroup': bloodGroup,
      'isDonor': isDonor,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      bloodGroup: map['bloodGroup'],
      isDonor: map['isDonor'] ?? false,
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
