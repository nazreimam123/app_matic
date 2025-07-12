import 'package:app_matic/src/model/model.dart';
import 'package:app_matic/src/services/api_services.dart';
import 'package:flutter/material.dart';

class Api2Provider with ChangeNotifier {
  final Api2Service _api2service = Api2Service();
  List<Appmatic> _items = [];
  bool _isloading = false;

  List<Appmatic> get items => _items;
  bool get isloading => _isloading;

  Future<void> fetchData() async {
    _isloading = true;
    notifyListeners();

    try {
      _items = await _api2service.fetchData();
    } catch (e) {
      debugPrint('error: $e');
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }
}
