import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_thread_clone/feature/authentication/repos/authentication_repo.dart';
import 'package:flutter_thread_clone/utils.dart';
import 'package:go_router/go_router.dart';

class SignUpViewMdel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);

    state = await AsyncValue.guard(
      () async => await _authRepo.emailSignUp(
        form["email"],
        form["password"],
      ),
    );

    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    }
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewMdel, void>(
  () => SignUpViewMdel(),
);
