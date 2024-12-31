import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_dto.dart';

// 추상 클래스로서 객체를 직접 생성할 수 없으며, 주로 상속을 통해 다른 클래스가 구현해야 하는 메서드를 정의

abstract interface class MovieDataSource {
  Future<List<MovieDto>> fetchNowPlayingMovies();

  Future<List<MovieDto>> fetchPopularMovies();

  Future<List<MovieDto>> fetchTopRatedMovies();

  Future<List<MovieDto>> fetchUpcomingMovies();

  Future<MovieDetailDto?> fetchMovieDetail(int id);
}
