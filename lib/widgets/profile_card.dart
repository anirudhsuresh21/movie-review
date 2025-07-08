import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 340,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.5), // 50% opacity at 0%
            Colors.white.withOpacity(0.2), // 20% opacity at 100%
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background image (top)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Apply radius here
              child: Image.asset(
                'assets/signup.png',
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Back button
          Positioned(
            top: 15,
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),

          // Profile and text
          Positioned(
            top: 120,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image and Name
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Profile Image
                    CircleAvatar(
                      radius: 46,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 44,
                        backgroundImage: AssetImage('assets/login.png'),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Name and handle
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(width: 12),
                        Text(
                          "Dilhara Sannasgala",
                          style: GoogleFonts.khand(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "@dilhara24",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),

                // Followers & Followings
                Row(
                  children: [
                    Text(
                      "500",
                      style: GoogleFonts.khand(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Followers",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "420",
                      style: GoogleFonts.khand(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Followings",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
