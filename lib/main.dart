import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saba_fashion_store/pages/cart_page.dart';
import 'package:saba_fashion_store/pages/home_page.dart';
import 'package:saba_fashion_store/pages/products_detailed_page.dart';
import 'package:saba_fashion_store/provider/cart_provider.dart';
import 'package:saba_fashion_store/provider/products.dart';
import 'auth/auth_page.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Products(),
          ),
          ChangeNotifierProvider(
            create: (context) => Cart(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
                color: Colors.transparent,
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.black),
                centerTitle: true,
                titleTextStyle:
                    GoogleFonts.bebasNeue(fontSize: 24, color: Colors.black)),
            textTheme: GoogleFonts.robotoTextTheme(),
            primarySwatch: Colors.deepPurple,
          ),
          home: const AuthPage(),
          routes: {
            CartPage.routeName: (context) => const CartPage(),
            HomePage.routeName: (context) => const HomePage(),
            ProductsDetail.routeName: (context) => const ProductsDetail()
          },
        ));
  }
}
