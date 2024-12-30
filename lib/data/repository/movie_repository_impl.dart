import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);
  final MovieDataSource _movieDataSource;

  @override
  Future<List<Movie>> fetchMovies() async {
    final result = await _movieDataSource.fetchMovies();
    // domain 의 엔티티 모델로 매핑
    return result
        .map(
          (e) => Movie(
            id: e.id,
            poster_path: e.poster_path,
          ),
        )
        .toList();
  }
}
