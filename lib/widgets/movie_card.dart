import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie_review/common/utils.dart';
import 'package:movie_review/models/upcoming_movies.dart';
import 'package:movie_review/widgets/movie_detail_overlay.dart';

class MovieCard extends StatefulWidget {
  final Future<UpcomingMovies> future;
  final bool isDate;
  final bool isRating;
  const MovieCard(
      {super.key,
      this.isDate = false,
      this.isRating = false,
      required this.future});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  late ScrollController _scrollController;
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _showMovieDetail(Result movie, GlobalKey imageKey) {
    // Get the position of the tapped image
    final RenderBox? renderBox =
        imageKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final size = renderBox.size;
      final imageRect =
          Rect.fromLTWH(position.dx, position.dy, size.width, size.height);

      showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.transparent,
        transitionDuration: const Duration(
            milliseconds: 800), // Increased for smoother animation
        pageBuilder: (context, animation, secondaryAnimation) {
          return MovieDetailOverlay(
            movie: movie,
            onClose: () => Navigator.of(context).pop(),
            initialImageRect: imageRect,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data?.results;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: data?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // Calculate if this is the last visible card
                      double baseWidth = 130;
                      double itemWidth = 146; // card width + margin
                      double screenWidth = MediaQuery.of(context).size.width;
                      double itemPosition = index * itemWidth;
                      double visiblePosition = itemPosition - _scrollOffset;
                      bool isLastVisible =
                          visiblePosition > screenWidth - itemWidth &&
                              visiblePosition < screenWidth;

                      // Calculate dynamic width for the last visible card
                      double dynamicWidth = baseWidth;
                      if (isLastVisible) {
                        double visibility =
                            (visiblePosition - (screenWidth - itemWidth)) /
                                itemWidth;
                        dynamicWidth = baseWidth +
                            (visibility * 70); // Increase width by up to 30px
                      }

                      final GlobalKey imageKey = GlobalKey();

                      return GestureDetector(
                        onTap: () => _showMovieDetail(data![index], imageKey),
                        child: Container(
                          width: dynamicWidth,
                          margin: const EdgeInsets.only(right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                key: imageKey,
                                height: 190,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    "$imageUrl${data?[index].posterPath}",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[800],
                                        child: const Center(
                                          child: Text(
                                            'Error loading image',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${data?[index].originalTitle}",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 17,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (widget.isDate)
                                Text(
                                  DateFormat.yMMMMd()
                                      .format(data![index].releaseDate),
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                      color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              if (widget.isRating)
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffFFB703),
                                      size: 16,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      (data![index].voteAverage)
                                              .toString()
                                              .contains('.')
                                          ? '${(data[index].voteAverage).toString().split('.').first}.${(data[index].voteAverage).toString().split('.')[1].substring(0, 1)}'
                                          : (data[index].voteAverage)
                                              .toString(),
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                          color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xffFFB703),
              ),
            );
          }
        });
  }
}
