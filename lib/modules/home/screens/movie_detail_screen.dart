import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:movie_review/models/cast.dart';
import 'package:movie_review/models/movie_detail.dart';
import 'package:movie_review/models/upcoming_movies.dart';
import 'package:movie_review/modules/home/home_module.dart';
import 'package:movie_review/services/api_services.dart';
import 'package:movie_review/widgets/cast_section.dart';
import 'package:movie_review/widgets/movie_actions.dart';
import 'package:movie_review/widgets/movie_detail_card.dart';

class MovieDetailScreen extends StatefulWidget {
  final int? movieId;
  const MovieDetailScreen({super.key, this.movieId});
  static String get linkRoute => "/movie_detail";
  static String get toRoute => "${HomeModule.moduleRoute}$linkRoute";

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Future<MovieDetailModel> movieDetailFuture;
  late Future<CastModel> castFuture;
  ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    movieDetailFuture = apiServices.getMovieDetail(widget.movieId ?? 11);
    castFuture = apiServices.getCastDetails(widget.movieId ?? 11);
    // log(movieDetailFuture as String);
  }

  String getDirectorName(List<Cast> crewList) {
    try {
      final director = crewList.firstWhere(
        (member) => member.job == 'Director',
      );
      return director.name;
    } catch (e) {
      return 'N/A';
    }
  }
  // findDirector

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff002335),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              FutureBuilder(
                  future: Future.wait([
                    movieDetailFuture,
                    castFuture,
                  ]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data?[0] as MovieDetailModel;
                      var data1 = snapshot.data?[1] as CastModel;
                      return Column(
                        children: [
                          MovieDetailCard(
                            movieName: data.originalTitle,
                            movieDesc: data.overview,
                            backDrop: data.backdropPath,
                            date: DateFormat('yMMMd').format(data.releaseDate),
                            duration: data.runtime,
                            posterPath: data.posterPath,
                            production: data.productionCompanies
                                .map((e) => e.name)
                                .join(', '),
                            director: getDirectorName(data1.crew),
                          ),
                          const SizedBox(height: 20),
                          MovieActions(),
                          const SizedBox(height: 10),
                          Text(
                            "${data.overview}",
                            style: GoogleFonts.poppins(
                                color: Colors.grey, fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          CastSection(
                            castList: data1.cast,
                            crewList: data1.crew,
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
                  }),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
