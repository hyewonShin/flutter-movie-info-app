import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchMoviesUsecase {
  FetchMoviesUsecase(this._movieRepository);

  final MovieRepository _movieRepository;

  Future<List<Movie>> execute() async {
    return await _movieRepository.fetchNowPlayingMovies();
  }
}
