import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:saba_fashion_store/utils/const.dart';

class GoogleNavbar extends StatelessWidget {
  const GoogleNavbar({super.key, required this.onTabChange});
  final void Function(int)? onTabChange;
  @override
  Widget build(BuildContext context) {
    return GNav(
        onTabChange: (value) => onTabChange!(value),
        tabBorderRadius: 8,
        backgroundColor: backgroundColor.withOpacity(0.05),
        tabBackgroundColor: backgroundColor.withOpacity(0.3),
        mainAxisAlignment: MainAxisAlignment.center,
        gap: 10,
        tabs: const [
          GButton(
            icon: CupertinoIcons.home,
            text: 'Home',
            iconActiveColor: Colors.white,
            textColor: Colors.white,
          ),
          GButton(
            icon: CupertinoIcons.bag,
            text: 'Cart',
            iconActiveColor: Colors.white,
            textColor: Colors.white,
          ),
          GButton(
            icon: CupertinoIcons.person,
            text: 'Profile',
            iconActiveColor: Colors.white,
            textColor: Colors.white,
          )
        ]);
  }
}
