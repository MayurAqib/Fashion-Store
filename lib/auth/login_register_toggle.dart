import 'package:flutter/material.dart';
import 'package:saba_fashion_store/pages/login_page.dart';
import 'package:saba_fashion_store/pages/register_page.dart';

class LoginRegisterToggle extends StatefulWidget {
  const LoginRegisterToggle({super.key});

  @override
  State<LoginRegisterToggle> createState() => _LoginRegisterToggleState();
}

class _LoginRegisterToggleState extends State<LoginRegisterToggle> {
  // ! INITIALLY SHOW THE LOGIN PAGE
  bool showLoginPage = true;
  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
