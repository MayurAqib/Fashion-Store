import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/2290/2290464.png',
              height: 200,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Dream',
              style: GoogleFonts.comforterBrush(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff424874)),
            ),
            Text(
              'fashion store',
              style: GoogleFonts.bebasNeue(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            )
          ],
        ),
      ),
    );
  }
}
