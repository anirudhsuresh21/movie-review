import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/utils.dart';

class MovieDetailCard extends StatefulWidget {
  final String? backDrop;
  final String? movieName;
  final String? movieDesc;
  final String? director;
  final String? date;
  final String? posterPath;
  final int? duration;
  final String? production;

  const MovieDetailCard({
    super.key,
    this.backDrop,
    this.movieName,
    this.movieDesc,
    this.director,
    this.date,
    this.posterPath,
    this.duration,
    this.production,
  });

  @override
  State<MovieDetailCard> createState() => _MovieDetailCardState();
}

class _MovieDetailCardState extends State<MovieDetailCard> {
  String formatRuntime(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return '${hours}h ${mins}min';
  }

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
              child: Image.network(
                '$imageUrl${widget.backDrop}',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    color: Colors.grey[800],
                    child: const Center(
                      child: Icon(Icons.movie, color: Colors.white, size: 50),
                    ),
                  );
                },
              ),
            ),
          ),

          // Back button
          Positioned(
            top: 15,
            left: 15,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
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
                    // Movie Poster
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        '$imageUrl${widget.posterPath}',
                        width: 120,
                        height: 160,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 120,
                            height: 160,
                            color: Colors.grey[800],
                            child: const Icon(
                              Icons.movie,
                              color: Colors.white,
                              size: 50,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Movie Title and Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.movieName}",
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
                              Expanded(
                                child: Text(
                                  "Directed by ${widget.director ?? 'Unknown'}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.people,
                                  color: Colors.grey, size: 16),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  widget.production ?? "Production companies",
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
                // Movie metadata
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Icon(Icons.access_time_outlined,
                          color: Colors.grey, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        formatRuntime(widget.duration ?? 0),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.calendar_month_outlined,
                          color: Colors.grey, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        "${widget.date}",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.remove_red_eye_outlined,
                          color: Colors.grey, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        "Not Watched",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
