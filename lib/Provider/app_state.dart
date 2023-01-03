import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState with ChangeNotifier {
  bool _isLoading = true;
  bool _isFirstTime= false;

  bool get isLoading => _isLoading;
  bool get isFirstTime => _isFirstTime;

  AppState() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (_isFirstTime) {
      prefs.setBool('isFirstTime', false);
    }

    _isLoading = false;
    notifyListeners();
  }
}