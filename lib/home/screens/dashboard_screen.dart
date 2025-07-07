import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff002335),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  (index) => Container(
                    margin: const EdgeInsets.only(right: 10.0, top: 10),
                    // width: 130, // 👈 Give it a fixed width
                    // height: 190, // 👈 Give it a fixed height
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/Test.png"),
                        Text(
                          "Inside Out 2",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 17,
                              color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
