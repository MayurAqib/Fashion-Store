import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saba_fashion_store/utils/const.dart';

import '../utils/products_list.dart';

enum FilterOptions { favourite, all }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/homePage';
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user =
      FirebaseAuth.instance.currentUser!; // Firebase Current user details
  bool _showFavouriteOnly = false;

  @override
  Widget build(BuildContext context) {
    // Provider.of<Products>(context).products;
    return Scaffold(
        backgroundColor: backgroundColor.withOpacity(0.05),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('D r e a m   F a s h i o n',
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userData = snapshot.data!.data() as Map<String, dynamic>;

                return Padding(
                  padding: const EdgeInsets.only(left: 7, bottom: 2, top: 5),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        userData['imageUrl'],
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: backgroundColor,
                  ),
                );
              }
            },
          ),
          actions: [
            PopupMenuButton(
                color: Colors.black,
                onSelected: (FilterOptions selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOptions.favourite) {
                      _showFavouriteOnly = true;
                    } else {
                      _showFavouriteOnly = false;
                    }
                  });
                },
                itemBuilder: (context) => const [
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        value: FilterOptions.favourite,
                        child: Center(
                          child: Text(
                            'Only Favorite',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        padding: EdgeInsets.zero,
                        value: FilterOptions.all,
                        child: Center(
                          child: Text(
                            'Show All',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ])
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Stack(children: [
                const SizedBox(
                  height: 170,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 140,
                    // width: 440,
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/img/Hina.png',
                        height: 170,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Big Sale',
                              style: GoogleFonts.comforterBrush(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text(
                              'Get the trendy\nfashion at a discount\nof upto 50%',
                              style: GoogleFonts.montserrat(
                                  // fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                )
              ]),
              const SizedBox(height: 20),
              // SearchTextfield(
              // onChanged: (value) => filterProductList(value),
              // ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Products',
                  style: GoogleFonts.bebasNeue(
                      color: const Color(0xff424874), fontSize: 25),
                ),
              ),
              Expanded(
                child: ProductList(
                  showFavs: _showFavouriteOnly,
                ),
              )
            ],
          ),
        ));
  }
}
