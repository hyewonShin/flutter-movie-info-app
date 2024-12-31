import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_dto.dart';

class MovieAssetDataSourceImpl implements MovieDataSource {
  // BaseRemoteRepository에서 제공하는 client getter를 통해 Dio를 가져와 사용
  final Dio _client;

  MovieAssetDataSourceImpl(Dio client) : _client = client;

  Future<List<MovieDto>> fetchNowPlayingMovies() async {
    try {
      final response = await _client.get('movie/now_playing', queryParameters: {
        'language': 'ko-KR',
        'page': 1,
      });
      print('😀 NowPlaying response >> $response');
      if (response.statusCode == 200) {
        // 응답 데이터에서 MovieDto 목록으로 변환
        return (response.data['results'] as List)
            .map((movie) => MovieDto.fromJson(movie))
            .toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetchNowPlayingMovies : $e');
    }
  }

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    // TODO: implement fetchMovieDetail
    throw UnimplementedError();
  }

  @override
  Future<List<MovieDto>> fetchPopularMovies() async {
    try {
      final response = await _client.get('movie/popular', queryParameters: {
        'language': 'ko-KR',
        'page': 1,
      });
      print('😀 PopularMovies response >> $response');
      if (response.statusCode == 200) {
        // 응답 데이터에서 MovieDto 목록으로 변환
        return (response.data['results'] as List)
            .map((movie) => MovieDto.fromJson(movie))
            .toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetchPopularMovies : $e');
    }
  }

  @override
  Future<List<MovieDto>> fetchTopRatedMovies() async {
    try {
      final response = await _client.get('movie/top_rated', queryParameters: {
        'language': 'ko-KR',
        'page': 1,
      });
      print('😀 TopRatedMovies response >> $response');
      if (response.statusCode == 200) {
        // 응답 데이터에서 MovieDto 목록으로 변환
        return (response.data['results'] as List)
            .map((movie) => MovieDto.fromJson(movie))
            .toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetchTopRatedMovies : $e');
    }
  }

  @override
  Future<List<MovieDto>> fetchUpcomingMovies() async {
    try {
      final response = await _client.get('movie/upcoming', queryParameters: {
        'language': 'ko-KR',
        'page': 1,
      });
      print('😀 UpcomingMovies response >> $response');
      if (response.statusCode == 200) {
        // 응답 데이터에서 MovieDto 목록으로 변환
        return (response.data['results'] as List)
            .map((movie) => MovieDto.fromJson(movie))
            .toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetchUpcomingMovies : $e');
    }
  }
}
