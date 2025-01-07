import 'package:flutter_movie_app/domain/entity/movie_entity.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail_entity.dart';

abstract interface class MovieRepository {
  Future<List<MovieEntity>?> fetchNowPlayingMovies();
  Future<List<MovieEntity>?> fetchPopularMovies();
  Future<List<MovieEntity>?> fetchTopRatedMovies();
  Future<List<MovieEntity>?> fetchUpcomingMovies();
  Future<MovieDetailEntity?> fetchMovieDetail(int id);
}
