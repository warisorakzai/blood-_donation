class OrganizationModel {
  final String id;
  final String name;
  final String image;
  final String address;
  final String phone;
  final String country;
  final String city;

  OrganizationModel({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
    required this.phone,
    required this.country,
    required this.city,
  });

  factory OrganizationModel.fromMap(String id, Map<String, dynamic> map) {
    return OrganizationModel(
      id: id,
      name: map['name'],
      image: map['image'],
      address: map['address'],
      phone: map['phone'],
      country: map['country'],
      city: map['city'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'address': address,
      'phone': phone,
      'country': country,
      'city': city,
    };
  }
}
