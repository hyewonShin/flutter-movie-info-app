import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);
  final MovieDataSource _movieDataSource;

  @override
  Future<List<Movie>> fetchNowPlayingMovies() async {
    final result = await _movieDataSource.fetchNowPlayingMovies();
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

  @override
  Future<List<Movie>> fetchPopularMovies() async {
    final result = await _movieDataSource.fetchPopularMovies();
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

  @override
  Future<List<Movie>> fetchTopRatedMovies() async {
    final result = await _movieDataSource.fetchTopRatedMovies();
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

  @override
  Future<List<Movie>> fetchUpcomingMovies() async {
    final result = await _movieDataSource.fetchUpcomingMovies();
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

  @override
  Future<MovieDetail> fetchMovieDetail(int id) async {
    final result = await _movieDataSource.fetchMovieDetail(id);
    // domain 의 엔티티 모델로 매핑
    if (result != null) {
      return MovieDetail.fromDTO(result.toJson());
    } else {
      throw Exception('Failed to fetch movie details');
    }
  }
}
