import 'package:flutter/material.dart';
import 'package:saba_fashion_store/utils/const.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key, required this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        onChanged: onChanged,
        cursorColor: colorDesign,
        style: TextStyle(color: colorDesign),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Search',
            hintStyle: TextStyle(color: colorDesign),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/2290/2290426.png',
                height: 10,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
