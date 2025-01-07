import 'package:flutter_movie_app/domain/entity/movie_detail_entity.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchMovieDetailUsecase {
  FetchMovieDetailUsecase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<MovieDetailEntity?> execute(int id) async {
    return await _movieRepository.fetchMovieDetail(id);
  }
}
