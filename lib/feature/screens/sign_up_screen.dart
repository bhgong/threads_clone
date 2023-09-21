import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:flutter_thread_clone/feature/authentication/view_models/signup_view_model.dart';
import 'package:flutter_thread_clone/feature/authentication/widgets/form_button.dart';
import 'package:flutter_thread_clone/feature/screens/home_screen.dart';
import 'package:flutter_thread_clone/feature/screens/login_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const String routeName = "signup";
  static const String routeURL = "/signup";
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final bool _obscureText = true;
  String _password = "";
  String _email = "";

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  String? _isEmailVaild() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Email not valid";
    }
    return null;
  }

  void _toggleObscureText() {
    _obscureText != _obscureText;
    setState(() {});
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailVaild() != null || !_isPassWordVaild()) {
      return;
    }

    ref.read(signUpForm.notifier).state = {
      "email": _email,
      "password": _password,
    };
  }

  // void _onPasswordSubmit() {
  //   if (!_isPassWordVaild()) {
  //     return;
  //   }

  //   // final state = ref.read(signUpForm.notifier).state;
  //   // ref.read(signUpForm.notifier).state = {
  //   //   ...state,
  //   //   "password": _password,
  //   // };
  // }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPassWordVaild() {
    return _password.isNotEmpty &&
        _password.length > 8 &&
        _password.length <= 20;
  }

  void _onNextTap() {
    _onSubmit();
    ref.read(signUpProvider.notifier).signUp(context);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size36,
              vertical: Sizes.size28,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'lib/images/threads-app-icon.svg',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Gaps.v40,
                  const Text(
                    "Create your account",
                    style: TextStyle(
                      fontSize: Sizes.size32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Gaps.v24,
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
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      onEditingComplete: _onSubmit,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorText: _isEmailVaild(),
                        hintText: 'Phone number or email address',
                        suffix: _email.isNotEmpty && _isEmailVaild() == null
                            ? const FaIcon(
                                FontAwesomeIcons.solidCircleCheck,
                                color: Colors.green,
                              )
                            : const SizedBox(),
                      ),
                      validator: (value) {
                        return "wrong number or email address";
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['email'] = newValue;
                        }
                      },
                    ),
                  ),
                  Gaps.v16,
                  Column(
                    children: [
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
                          controller: _passwordController,
                          autocorrect: false, // 자동수정 기능
                          onEditingComplete: _onSubmit,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "You'll need a password",
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: _toggleObscureText,
                                  child: FaIcon(
                                    _obscureText
                                        ? FontAwesomeIcons.eyeSlash
                                        : FontAwesomeIcons.eye,
                                    color: Colors.grey.shade500,
                                    size: Sizes.size20,
                                  ),
                                ),
                                Gaps.h16,
                                _isPassWordVaild()
                                    ? FaIcon(
                                        FontAwesomeIcons.solidCircleCheck,
                                        size: Sizes.size20,
                                        color: _isPassWordVaild()
                                            ? Colors.green
                                            : Colors.grey.shade400,
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                          validator: (value) {
                            return "wrong password";
                          },
                          onSaved: (newValue) {
                            if (newValue != null) {
                              formData['password'] = newValue;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: Sizes.size32,
                        width: Sizes.size96 +
                            Sizes.size96 +
                            Sizes.size96 +
                            Sizes.size20,
                        child: Text(
                          "Make sure it's 8 characters or more.",
                          style: TextStyle(
                            fontSize: Sizes.size16 + Sizes.size1,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size44,
            ),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              height: 100,
              child: GestureDetector(
                onTap: _onNextTap,
                child: FormButton(
                  disabled: ref.watch(signUpProvider).isLoading,
                  text: "Next",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
