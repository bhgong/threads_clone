import 'package:flutter/material.dart';
import 'package:flutter_thread_clone/widgets/dark_mode_model.dart';
import 'package:flutter_thread_clone/widgets/repos/app_dark_mode_repo.dart';

class DarkModeViewModel extends ChangeNotifier {
  final AppDarkModeRepository _repository;

  late final DarkModeModel _darkModeModel = DarkModeModel(
    isDark: _repository.isDarkMode(),
  );

  DarkModeViewModel(this._repository);

  ThemeMode themoMode = ThemeMode.dark;

  bool get darkMode => _darkModeModel.isDark;

  void setDarkMode(bool value) async {
    _repository.setDarkMode(value);
    _darkModeModel.isDark = value;

    if (value == true) {
      themoMode = ThemeMode.dark;
    } else {
      themoMode = ThemeMode.light;
    }

    notifyListeners();
  }
}
