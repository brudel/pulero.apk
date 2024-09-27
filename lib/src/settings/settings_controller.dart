import 'package:flutter/material.dart';
import 'package:pulero_apk/src/preferences_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
class SettingsController with ChangeNotifier {
  ThemeMode get themeMode => 
    ThemeMode.values.firstWhere(
      (e) => e.toString() == PreferencesService.getString('ThemeMode'),
      orElse: () => ThemeMode.system
    );

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    ThemeMode oldThemeMode = themeMode;

    if (newThemeMode == oldThemeMode) return;
    
    PreferencesService.setString('ThemeMode', newThemeMode.toString());

    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }
}
