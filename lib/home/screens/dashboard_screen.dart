import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_review/widgets/movie_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xff002335),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff002335),
        foregroundColor: Colors.white,
        titleSpacing: 0, // Makes title start right after the drawer icon
        title: Row(
          children: [
            const SizedBox(width: 8), // spacing after drawer
            Image.asset(
              "assets/LOGO.png",
              scale: 2.7,
            ),
            const SizedBox(width: 10),
            Text(
              "CINEPHILER",
              style: GoogleFonts.khand(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      backgroundColor: const Color(0xff002335),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome back, ",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                      text: 'Ani',
                      style: GoogleFonts.poppins(
                        color: Color(
                            0xffFFB703), // Green color similar to the image
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                      text: '!',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Review or log film you’ve watched...",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "New Releases",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                    color: Colors.white),
              ),
              // Horizontal scroll view
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // 👈 Add this line
                child: Row(
                  children: List.generate(
                    5,
                    (index) => MovieCard(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "New Releases",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                    color: Colors.white),
              ),
              // Horizontal scroll view
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // 👈 Add this line
                child: Row(
                  children: List.generate(
                    5,
                    (index) => MovieCard(
                      isDate: true,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "New Releases",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                    color: Colors.white),
              ),
              // Horizontal scroll view
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // 👈 Add this line
                child: Row(
                  children: List.generate(
                    5,
                    (index) => MovieCard(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
