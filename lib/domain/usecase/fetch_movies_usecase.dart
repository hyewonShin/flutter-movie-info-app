import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchMoviesUsecase {
  FetchMoviesUsecase(this._movieRepository);

  final MovieRepository _movieRepository;

  Future<List<Movie>> fetchNowPlayingMovies() async {
    return await _movieRepository.fetchNowPlayingMovies();
  }

  Future<List<Movie>> fetchPopularMovies() async {
    return await _movieRepository.fetchPopularMovies();
  }

  Future<List<Movie>> fetchTopRatedMovies() async {
    return await _movieRepository.fetchTopRatedMovies();
  }

  Future<List<Movie>> fetchUpcomingMovies() async {
    return await _movieRepository.fetchUpcomingMovies();
  }

  Future<MovieDetail?> fetchMovieDetail(int id) async {
    var result = await _movieRepository.fetchMovieDetail(id);
    return result;
  }
}
