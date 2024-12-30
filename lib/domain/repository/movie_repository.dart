import 'package:flutter_movie_app/domain/entity/movie.dart';

abstract interface class MovieRepository {
  Future<List<Movie>> fetchMovies();
}
