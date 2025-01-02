import 'package:flutter_movie_app/domain/entity/movie_entity.dart';

class MovieState {
  final List<MovieEntity> nowPlayingMovies;
  final List<MovieEntity> popularMovies;
  final List<MovieEntity> topRatedMovies;
  final List<MovieEntity> upcomingMovies;
  final MovieEntity? movieDetail;

  MovieState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.upcomingMovies = const [],
    this.movieDetail,
  });

  MovieState copyWith({
    List<MovieEntity>? nowPlayingMovies,
    List<MovieEntity>? popularMovies,
    List<MovieEntity>? topRatedMovies,
    List<MovieEntity>? upcomingMovies,
    MovieEntity? movieDetail,
  }) {
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      movieDetail: movieDetail ?? this.movieDetail,
    );
  }
}
