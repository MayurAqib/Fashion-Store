import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saba_fashion_store/utils/const.dart';
import 'package:saba_fashion_store/utils/my_button.dart';
import 'package:saba_fashion_store/utils/my_textfield.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  //! controller
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
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
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset Password',
                  style: GoogleFonts.bebasNeue(
                      color: const Color(0xff424874), fontSize: 50),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter the email associated with your account and we will send an email with password reset link',
                  style: GoogleFonts.lato(color: colorDesign),
                ),
                const SizedBox(height: 20),
                MyTextfield(
                    labelText: 'Email',
                    obscure: false,
                    controller: _emailController),
                const SizedBox(height: 20),
                MyButton(
                    buttonText: 'Send',
                    onTap: () async {
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: _emailController.text.trim());
                        // ignore: use_build_context_synchronously
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Text('Reset link sent to your email'),
                            content: Text('Check your email'),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                content: Text(e.message.toString())));
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
