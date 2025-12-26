class BloodRequestModel {
  final String id;
  final String title;
  final String bloodGroup;
  final int bags;
  final String hospital;
  final String reason;
  final String contactName;
  final String phone;
  final String country;
  final String city;
  final String userId;
  final DateTime createdAt;

  BloodRequestModel({
    required this.id,
    required this.title,
    required this.bloodGroup,
    required this.bags,
    required this.hospital,
    required this.reason,
    required this.contactName,
    required this.phone,
    required this.country,
    required this.city,
    required this.userId,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'bloodGroup': bloodGroup,
      'bags': bags,
      'hospital': hospital,
      'reason': reason,
      'contactName': contactName,
      'phone': phone,
      'country': country,
      'city': city,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory BloodRequestModel.fromMap(String id, Map<String, dynamic> map) {
    return BloodRequestModel(
      id: id,
      title: map['title'],
      bloodGroup: map['bloodGroup'],
      bags: map['bags'],
      hospital: map['hospital'],
      reason: map['reason'],
      contactName: map['contactName'],
      phone: map['phone'],
      country: map['country'],
      city: map['city'],
      userId: map['userId'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
