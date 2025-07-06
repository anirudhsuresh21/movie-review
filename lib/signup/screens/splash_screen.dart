import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_review/widgets/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff002335),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Stack(children: [
              // Background Banner
              Image.asset(
                "assets/Banner.png",
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),

              // Centered Logo
              Positioned(
                top: 270,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset("assets/LOGO.png"),
                ),
              ),
            ]),
            const SizedBox(height: 100), // spacing below the banner
            Center(
              child: SizedBox(
                width: 300,
                child: Text(
                  '“Track films you’ve watched. Save those you want to see.”',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 60),
            CustomButton(
              buttonText: "Get Started",
              buttonWidth: 280,
            )
          ],
        )),
      ),
    );
  }
}

// Stack(
//   children: [
//     // Background Banner
//     Image.asset(
//       "assets/Banner.png",
//       fit: BoxFit.fitWidth,
//       width: double.infinity,
//     ),
//
//     // Centered Logo
//     Positioned(
//       top: 270,
//       left: 0,
//       right: 0,
//       child: Center(
//         child: Image.asset("assets/LOGO.png"),
//       ),
//     ),

// Text & Button below the logo
// Positioned(
//   top: 420, // adjust as needed
//   left: 0,
//   right: 0,
//   child: Column(
//     children: [
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Text(
//           '“Track films you’ve watched. Save those you want to see.”',
//           textAlign: TextAlign.center,
//           style: GoogleFonts.poppins(
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//             fontSize: 24,
//           ),
//         ),
//       ),
//       const SizedBox(height: 30),
//       CustomButton(
//         buttonText: "Get Started",
//         buttonWidth: 250,
//       )
//     ],
//   ),
// ),
//       ],
//     ),
