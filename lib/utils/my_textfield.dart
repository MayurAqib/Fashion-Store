import 'package:flutter/material.dart';

import 'const.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield(
      {super.key,
      required this.labelText,
      required this.obscure,
      required this.controller,
      this.keyboard});
  final String labelText;
  final bool obscure;
  final TextInputType? keyboard;
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
          controller: controller,
          keyboardType: keyboard,
          obscureText: obscure,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              label: Text(
                labelText,
                style: TextStyle(color: colorDesign),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colorDesign)))),
    );
  }
}
