import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_review/widgets/movie_actions.dart';
import 'package:movie_review/widgets/movie_detail_card.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff002335),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            MovieDetailCard(),
            SizedBox(
              height: 10,
            ),
            MovieActions(),
          ],
        ),
      ),
    );
  }
}
