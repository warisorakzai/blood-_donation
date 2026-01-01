import 'package:blood_donation/Models/organization_model.dart';
import 'package:blood_donation/Provider/organization_service.dart';
import 'package:flutter/widgets.dart';

class OrganizationProvider with ChangeNotifier {
  List<OrganizationModel> organizations = [];  
  final _service = OrganizationService();
  bool isLoading = false;

  String? selectedCountry;
  String? selectedCity;

  Future<void> loadOrganizations() async {
    isLoading = true;
    notifyListeners();

    organizations = await _service.fetchOrganizations(
      selectedCountry,
      selectedCity,
    );

    isLoading = false;
    notifyListeners();
  }

  void setCountry(String value) {
    selectedCountry = value;
    loadOrganizations();
  }

  void setCity(String value) {
    selectedCity = value;
    loadOrganizations();
  }

  Future<void> addOrganization(OrganizationModel org) async {
    await _service.addOrganization(org);
    loadOrganizations();
  }
}
