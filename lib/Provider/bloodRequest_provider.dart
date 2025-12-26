import 'package:blood_donation/Models/bloodrequest_model.dart';
import 'package:blood_donation/core/services/bloodrequesT_Service.dart';
import 'package:flutter/material.dart';

class BloodrequestProvider with ChangeNotifier {
  final _service = BloodrequestService();

  bool isLoading = false;

  Future<void> bloodRequest(BloodRequestModel request) async {
    isLoading = true;
    notifyListeners();

    await _service.createRequest(request);

    isLoading = true;
    notifyListeners();
  }

  Stream<List<BloodRequestModel>> get requests => _service.getRequets();
}
