import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCard extends StatefulWidget {
  final bool isDate;
  final bool isRating;
  const MovieCard({super.key, this.isDate = false, this.isRating = false});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                fontWeight: FontWeight.w300, fontSize: 17, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
          if (widget.isDate)
            Text(
              "19 July 2004",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}
