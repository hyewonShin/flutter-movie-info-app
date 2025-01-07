import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/domain/entity/movie_entity.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail_entity.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);
  final MovieDataSource _movieDataSource;

  @override
  Future<List<MovieEntity>?> fetchNowPlayingMovies() async {
    final result = await _movieDataSource.fetchNowPlayingMovies();
    if (result == null) {
      return null;
    }
    // domain 의 엔티티 모델로 매핑
    return result.results
        .map(
          (e) => MovieEntity(
            id: e.id,
            poster_path: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<MovieEntity>?> fetchPopularMovies() async {
    final result = await _movieDataSource.fetchPopularMovies();
    if (result == null) {
      return null;
    }
    // domain 의 엔티티 모델로 매핑
    return result.results
        .map(
          (e) => MovieEntity(
            id: e.id,
            poster_path: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<MovieEntity>?> fetchTopRatedMovies() async {
    final result = await _movieDataSource.fetchTopRatedMovies();
    if (result == null) {
      return null;
    }
    // domain 의 엔티티 모델로 매핑
    return result.results
        .map(
          (e) => MovieEntity(
            id: e.id,
            poster_path: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<MovieEntity>?> fetchUpcomingMovies() async {
    final result = await _movieDataSource.fetchUpcomingMovies();
    if (result == null) {
      return null;
    }
    // domain 의 엔티티 모델로 매핑
    return result.results
        .map(
          (e) => MovieEntity(
            id: e.id,
            poster_path: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<MovieDetailEntity?> fetchMovieDetail(int id) async {
    final result = await _movieDataSource.fetchMovieDetail(id);
    if (result == null) {
      return null;
    }
    // domain 의 엔티티 모델로 매핑
    return MovieDetailEntity(
        id: result.id,
        title: result.title,
        originalTitle: result.originalTitle,
        budget: result.budget,
        genres: result.genres.map((e) => e.name).toList(),
        overview: result.overview,
        popularity: result.popularity,
        posterPath: result.posterPath,
        productionCompanyLogos: result.productionCompanies
            .where((e) => e.logoPath != null)
            .map((e) => 'https://image.tmdb.org/t/p/w500${e.logoPath}')
            .toList(),
        releaseDate: result.releaseDate,
        revenue: result.revenue,
        runtime: result.runtime,
        status: result.status,
        voteAverage: result.voteAverage,
        voteCount: result.voteCount);
  }
}
