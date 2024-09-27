import 'package:flutter/material.dart';
import 'package:pulero_apk/src/preferences_service.dart';

class LoginController with ChangeNotifier {

  void login(String nickname) {
    PreferencesService.setString('nickname', nickname);
    PreferencesService.setBool('loggedIn', true);
    notifyListeners();
  }

  void logout(BuildContext? context) async {
    PreferencesService.setBool('loggedIn', false);
    if (context != null) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
    notifyListeners();
  }

  bool isLoggedIn() {
    return PreferencesService.getBool('loggedIn') ?? false;
  }

  String get nickname {
    return PreferencesService.getString('nickname') ?? '';
  }
}