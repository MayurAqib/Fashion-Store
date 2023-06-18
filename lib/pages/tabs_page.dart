import 'package:flutter/material.dart';
import 'package:saba_fashion_store/pages/home_page.dart';
import 'package:saba_fashion_store/pages/profile_page.dart';
import 'package:saba_fashion_store/utils/google_navbar.dart';

import 'cart_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;
  void tabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [const HomePage(), const CartPage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: GoogleNavbar(
        onTabChange: (index) => tabChange(index),
      ),
    );
  }
}
