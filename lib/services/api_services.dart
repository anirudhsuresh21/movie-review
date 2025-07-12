import 'dart:convert';
import 'dart:developer';

import 'package:movie_review/models/top_rated.dart';

import '../models/cast.dart';
import '../models/movie_detail.dart';
import '../models/upcoming_movies.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=5c2a82bd0fb1b5b32faaf90c939fb3f5";
late String endPoint;

class ApiServices {
  Future<UpcomingMovies> getUpcomingMovies() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("Success + ${response.body}");
      return UpcomingMovies.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to Load Upcoming Movies");
  }

  Future<UpcomingMovies> getTopRatedMovies() async {
    endPoint = "movie/top_rated";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("Success1 + ${response.body}");
      var response1 = UpcomingMovies.fromJson(jsonDecode(response.body));
      return response1;
    }
    throw Exception("Failed to Load Upcoming Movies");
  }

  Future<UpcomingMovies> getPopularMovies() async {
    endPoint = "movie/popular";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("Success1 + ${response.body}");
      var response1 = UpcomingMovies.fromJson(jsonDecode(response.body));
      return response1;
    }
    throw Exception("Failed to Load Upcoming Movies");
  }

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    endPoint = 'movie/$movieId';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('Raw response: ${response.body}');
      var response1 = MovieDetailModel.fromJson(jsonDecode(response.body));
      log('Movie title: ${response1.title}');
      log('Movie overview: ${response1.overview}');
      log('Movie genres: ${response1.genres.map((g) => g.name).toList()}');
      return response1;
    }
    throw Exception('failed to load  movie details');
  }

  Future<CastModel> getCastDetails(int movieId) async {
    endPoint = 'movie/$movieId/credits';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return CastModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }
}
