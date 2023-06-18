import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saba_fashion_store/auth/login_register_toggle.dart';
import 'package:saba_fashion_store/pages/tabs_page.dart';

import '../pages/splash_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }
          if (!snapshot.hasData) {
            return const LoginRegisterToggle();
          } else {
            return const TabsPage();
          }
        },
      ),
    );
  }
}
