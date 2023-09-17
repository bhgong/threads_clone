import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_thread_clone/widgets/dark_mode_model.dart';
import 'package:flutter_thread_clone/widgets/repos/app_dark_mode_repo.dart';

class DarkModeViewModel extends Notifier<DarkModeModel> {
  final AppDarkModeRepository _repository;

  DarkModeViewModel(this._repository);

  void setDarkMode(bool value) async {
    _repository.setDarkMode(value);
    state = DarkModeModel(isDark: value);
  }

  @override
  DarkModeModel build() {
    return DarkModeModel(
      isDark: _repository.isDarkMode(),
    );
  }
}

final darkModeProvider = NotifierProvider<DarkModeViewModel, DarkModeModel>(
  () => throw (),
);
