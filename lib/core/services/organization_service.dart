import 'package:blood_donation/Models/organization_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrganizationService {
  final _firestore = FirebaseFirestore.instance;
  Future<void> addOrganization(OrganizationModel org) async {
    await _firestore.collection('organizations').add(org.toMap());
  }

  Future<List<OrganizationModel>> fetchOrganizations(
    String? country,
    String? city,
  ) async {
    Query query = _firestore.collection('organizations');
    if (country != null) {
      query = query.where('country', isEqualTo: country);
    }
    if (city != null) {
      query = query.where('city', isEqualTo: city);
    }
    final snapshot = await query.get();
    return snapshot.docs
        .map(
          (doc) => OrganizationModel.fromMap(
            doc.id,
            doc.data() as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}
