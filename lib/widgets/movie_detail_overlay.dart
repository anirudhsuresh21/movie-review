// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie_review/common/utils.dart';
import 'package:movie_review/models/upcoming_movies.dart';

class MovieDetailOverlay extends StatefulWidget {
  final Result movie;
  final VoidCallback onClose;
  final Rect initialImageRect;

  const MovieDetailOverlay({
    super.key,
    required this.movie,
    required this.onClose,
    required this.initialImageRect,
  });

  @override
  State<MovieDetailOverlay> createState() => _MovieDetailOverlayState();
}

class _MovieDetailOverlayState extends State<MovieDetailOverlay>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Rect?> _imageRectAnimation;
  late Animation<double> _contentOpacityAnimation;
  late Animation<double> _overlayOpacityAnimation;
  bool _animationsInitialized = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_animationsInitialized) {
      _initializeAnimations();
      _animationsInitialized = true;
      _animationController.forward();
    }
  }

  void _initializeAnimations() {
    // Calculate final image position (centered but lower)
    final screenSize = MediaQuery.of(context).size;
    final finalImageRect = Rect.fromLTWH(
      (screenSize.width - 180) / 2, // Center horizontally with smaller width
      screenSize.height * 0.18, // Lower the image position
      180, // Reduced width
      240, // Reduced height
    );

    _imageRectAnimation = RectTween(
      begin: widget.initialImageRect,
      end: finalImageRect,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutQuart,
    ));

    _overlayOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
    ));

    _contentOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_animationsInitialized) {
      return const SizedBox.shrink();
    }

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Background overlay
          AnimatedBuilder(
            animation: _overlayOpacityAnimation,
            builder: (context, child) {
              return Container(
                color: Colors.black
                    .withOpacity(0.85 * _overlayOpacityAnimation.value),
              );
            },
          ),

          // Main content container
          Center(
            child: AnimatedBuilder(
              animation: _contentOpacityAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: 0.8 + (0.2 * _contentOpacityAnimation.value),
                  child: Opacity(
                    opacity: _contentOpacityAnimation.value,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 60),
                      height: MediaQuery.of(context).size.height * 0.75,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xff002335),
                            const Color(0xff003247),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color(0xffFFB703),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 25,
                            offset: const Offset(0, 15),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Header with close button
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(23),
                                topRight: Radius.circular(23),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Movie Details",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xffFFB703),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: widget.onClose,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.red.withOpacity(0.5),
                                        width: 1,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(height: 240),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 12,
                                              horizontal: 16,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                color: const Color(0xffFFB703)
                                                    .withOpacity(0.3),
                                                width: 1,
                                              ),
                                            ),
                                            child: Text(
                                              widget.movie.title,
                                              style: GoogleFonts.poppins(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                height: 1.2,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(height: 16),

                                          // Rating and release date in a row
                                          Row(
                                            children: [
                                              // Rating card
                                              Expanded(
                                                child: Container(
                                                  height:
                                                      90, // Fixed height for consistency
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffFFB703)
                                                            .withOpacity(0.1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color: const Color(
                                                              0xffFFB703)
                                                          .withOpacity(0.3),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(6),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xffFFB703),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: const Icon(
                                                          Icons.star,
                                                          color: Colors.black,
                                                          size: 12,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 6),
                                                      Text(
                                                        widget.movie.voteAverage
                                                            .toStringAsFixed(1),
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: const Color(
                                                              0xffFFB703),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 2),
                                                      Text(
                                                        "${widget.movie.voteCount} votes",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 10,
                                                          color:
                                                              Colors.grey[400],
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 12),

                                              // Release date card
                                              Expanded(
                                                child: Container(
                                                  height:
                                                      90, // Fixed height for consistency
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        const Color(0xffFFB703)
                                                            .withOpacity(0.2),
                                                        const Color(0xffFFB703)
                                                            .withOpacity(0.1),
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color: const Color(
                                                              0xffFFB703)
                                                          .withOpacity(0.5),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.calendar_today,
                                                        size: 22,
                                                        color: const Color(
                                                            0xffFFB703),
                                                      ),
                                                      const SizedBox(height: 6),
                                                      const SizedBox(height: 2),
                                                      Text(
                                                        DateFormat.yMMMd()
                                                            .format(widget.movie
                                                                .releaseDate),
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 16,
                                                          color: const Color(
                                                              0xffFFB703),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      Text(
                                                        "Released",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 10,
                                                          color:
                                                              Colors.grey[400],
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16),

                                          // Overview section
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                color: Colors.white
                                                    .withOpacity(0.1),
                                                width: 1,
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.description,
                                                      color: const Color(
                                                          0xffFFB703),
                                                      size: 18,
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      "Overview",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: const Color(
                                                            0xffFFB703),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 12),
                                                Text(
                                                  widget.movie.overview.length >
                                                          150
                                                      ? "${widget.movie.overview.substring(0, 150)}..."
                                                      : widget.movie.overview,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    color: Colors.grey[300],
                                                    height: 1.5,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                if (widget
                                                        .movie.overview.length >
                                                    150)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // Show full overview dialog
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              AlertDialog(
                                                            backgroundColor:
                                                                const Color(
                                                                    0xff002335),
                                                            title: Text(
                                                              "Full Overview",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: const Color(
                                                                    0xffFFB703),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            content:
                                                                SingleChildScrollView(
                                                              child: Text(
                                                                widget.movie
                                                                    .overview,
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  color: Colors
                                                                          .grey[
                                                                      300],
                                                                  height: 1.5,
                                                                ),
                                                              ),
                                                            ),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        context),
                                                                child: Text(
                                                                  "Close",
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    color: const Color(
                                                                        0xffFFB703),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 12,
                                                          vertical: 6,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                                  0xffFFB703)
                                                              .withOpacity(0.2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          border: Border.all(
                                                            color: const Color(
                                                                    0xffFFB703)
                                                                .withOpacity(
                                                                    0.5),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              "View More",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 12,
                                                                color: const Color(
                                                                    0xffFFB703),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 4),
                                                            Icon(
                                                              Icons
                                                                  .arrow_forward,
                                                              size: 14,
                                                              color: const Color(
                                                                  0xffFFB703),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 16),

                                          // Additional info in cards
                                          Row(
                                            children: [
                                              Expanded(
                                                child: _buildInfoCard(
                                                  "Language",
                                                  widget.movie.originalLanguage
                                                      .toUpperCase(),
                                                  Icons.language,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: _buildInfoCard(
                                                  "Popularity",
                                                  widget.movie.popularity
                                                      .toInt()
                                                      .toString(),
                                                  Icons.trending_up,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Animated image (now centered)
          AnimatedBuilder(
            animation: _imageRectAnimation,
            builder: (context, child) {
              final rect = _imageRectAnimation.value!;
              return Positioned(
                left: rect.left,
                top: rect.top,
                width: rect.width,
                height: rect.height,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffFFB703).withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 25,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Image.network(
                          "$imageUrl${widget.movie.posterPath}",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[800],
                              child: const Icon(
                                Icons.movie,
                                size: 50,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                        // Gradient overlay for better image presentation
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.1),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffFFB703).withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xffFFB703),
            size: 20,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: Colors.grey[400],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
