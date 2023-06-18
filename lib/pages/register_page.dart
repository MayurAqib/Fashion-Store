import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/const.dart';
import '../utils/my_button.dart';
import '../utils/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.showLoginPage});
  final VoidCallback showLoginPage;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //! Controllers

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  //! DISPOSING CONTROLLERS
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  // todo: SIGN UP FUNCTION USING FIREBASE
  Future singUp() async {
    try {
      if (_passwordController.text.trim() ==
          _confirmPasswordController.text.trim()) {
        showDialog(
            context: context,
            builder: (context) => Center(
                child: CircularProgressIndicator(color: backgroundColor)));
        //create user
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim());

        // ignore: use_build_context_synchronously
        Navigator.pop(context); //pop the progress indicator
        //! ADDING USER DETAILS IN FIREBASE
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.email)
            .set({
          'Name':
              '${_firstNameController.text.trim()[0].toUpperCase()}${_firstNameController.text.trim().substring(1).toLowerCase()} ${_lastNameController.text.trim()[0]}${_lastNameController.text.trim().substring(1).toLowerCase()}} ',
          'First Name': _firstNameController.text.trim(),
          'email': _emailController.text.trim(),
          'Age': int.parse(_ageController.text),
          'imageUrl':
              'https://img.icons8.com/?size=512&id=yYKBj6wyJqtH&format=png'
        });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  content: Text('Passwords do not match',
                      style: GoogleFonts.bebasNeue(
                          color: Colors.red, fontSize: 18)));
            });
      }
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
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
                  'https://cdn-icons-png.flaticon.com/512/7817/7817039.png',
                  height: 80,
                ),
                const SizedBox(height: 20),
                Text(
                  'Hello there!',
                  // 'welcome to our store',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bebasNeue(
                      color: const Color(0xff424874), fontSize: 50),
                ),
                Text('Enter your details to register',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colorDesign, fontSize: 17)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: MyTextfield(
                        labelText: 'First Name',
                        obscure: false,
                        controller: _firstNameController,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: MyTextfield(
                        labelText: 'Last Name',
                        obscure: false,
                        controller: _lastNameController,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextfield(
                        labelText: 'Age',
                        obscure: false,
                        controller: _ageController,
                        keyboard: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: MyTextfield(
                        labelText: 'Email',
                        obscure: false,
                        controller: _emailController,
                      ),
                    ),
                  ],
                ),
                MyTextfield(
                  labelText: 'Password',
                  obscure: true,
                  controller: _passwordController,
                ),
                MyTextfield(
                  labelText: 'Confirm Password',
                  obscure: true,
                  controller: _confirmPasswordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  onTap: singUp,
                  buttonText: 'Register',
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a Member?  ',
                      style: GoogleFonts.lato(),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text('Login!',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 16, color: backgroundColor)),
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
