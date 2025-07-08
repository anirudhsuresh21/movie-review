import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailCard extends StatefulWidget {
  const MovieDetailCard({super.key});

  @override
  State<MovieDetailCard> createState() => _MovieDetailCardState();
}

class _MovieDetailCardState extends State<MovieDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.2),
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
        children: [
          // Top background image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/harry3.jpg',
                height: 180,
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

          // Movie details (below image)
          Positioned(
            top: 127,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Profile Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/harry.jpg',
                        width: 120,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Movie Title and Tag
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(height: 20),
                          Text(
                            "Harry Potter and the Prisoner of Azkaban",
                            style: GoogleFonts.khand(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.movie_outlined,
                                  color: Colors.grey, size: 16),
                              const SizedBox(width: 6),
                              Flexible(
                                child: Text(
                                  "Directed by Alfonso Cuarón",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.people,
                                  color: Colors.grey, size: 16),
                              const SizedBox(width: 6),
                              Flexible(
                                child: Text(
                                  "Warner Bros. Pictures, 1492 Pictures, Heyday Films, P of A Productions Limited",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Followers & Followings
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.access_time_outlined,
                        color: Colors.grey, size: 18),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        "2 hr 21 min",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.calendar_month_outlined,
                        color: Colors.grey, size: 18),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        "May 31, 2004",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.remove_red_eye_outlined,
                        color: Colors.grey, size: 18),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        "Not Watched",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
