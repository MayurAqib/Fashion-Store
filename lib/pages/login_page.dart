import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/const.dart';
import '../utils/my_button.dart';
import '../utils/my_textfield.dart';
import 'forgot_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.showRegisterPage});
  final VoidCallback showRegisterPage;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //! Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //! disposing Controllers
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  //todo--  SIGN IN FUNCTION USING FIREBASE

  Future logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(e.message.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.05),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/8643/8643545.png',
                  height: 130,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome Back!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bebasNeue(
                      color: const Color(0xff424874), fontSize: 50),
                ),
                Text('All your fashion needs come true here!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colorDesign, fontSize: 17)),
                const SizedBox(height: 20),
                MyTextfield(
                  labelText: 'Email',
                  obscure: false,
                  controller: _emailController,
                ),
                MyTextfield(
                  labelText: 'Password',
                  obscure: true,
                  controller: _passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPage()));
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  onTap: logIn,
                  buttonText: 'Login',
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(height: 70),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a Member?  ',
                      style: GoogleFonts.lato(color: colorDesign),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text('Sign up!',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 90, 20, 211))),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
