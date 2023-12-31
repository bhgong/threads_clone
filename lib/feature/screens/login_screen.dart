import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:flutter_thread_clone/feature/authentication/view_models/login_view_model.dart';
import 'package:flutter_thread_clone/feature/authentication/widgets/form_button.dart';
import 'package:flutter_thread_clone/feature/screens/home_screen.dart';
import 'package:flutter_thread_clone/feature/screens/sign_up_screen.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeName = "login";
  static const String routeURL = "/login";

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};
  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save(); //
        ref
            .read(loginProvider.notifier)
            .login(formData["email"]!, formData["password"]!, context);
      }
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "English (US)",
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v44,
              Center(
                child: SvgPicture.asset(
                  'lib/images/threads-app-icon.svg',
                  width: 60,
                  height: 60,
                ),
              ),
              Gaps.v44,
              Container(
                height: Sizes.size60,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(
                    Sizes.size5,
                  ),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Mobile number or email',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Plase write your email";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formData['email'] = newValue;
                    }
                  },
                ),
              ),
              Gaps.v16,
              Container(
                height: Sizes.size60,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(
                    Sizes.size5,
                  ),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Plase write your password";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formData['password'] = newValue;
                    }
                  },
                ),
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmitTap,
                child: FormButton(
                  disabled: ref.watch(loginProvider).isLoading,
                  // disabled: false,
                  text: "Log in",
                ),
              ),
              Gaps.v10,
              GestureDetector(
                onTap: () {},
                child: const FormButton(
                  disabled: true,
                  text: "Forgot password?",
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size44,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _onSignUpTap(context),
                child: const FormButton(
                  disabled: true,
                  text: "Create new account",
                ),
              ),
              Gaps.v40,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(
                    FontAwesomeIcons.meta,
                    color: Colors.grey.shade500,
                  ),
                  Gaps.h5,
                  Text(
                    "Meta",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.grey.shade500,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
