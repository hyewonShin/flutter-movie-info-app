import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto/movie_response_dto.dart';

class MovieAssetDataSourceImpl implements MovieDataSource {
  final Dio _client;

  MovieAssetDataSourceImpl(Dio client) : _client = client;

  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    try {
      final response = await _client.get('/now_playing', queryParameters: {
        'language': 'ko-KR',
        'page': 1,
      });
      if (response.statusCode == 200) {
        // 응답 데이터에서 MovieDto 목록으로 변환
        return MovieResponseDto.fromJson(response.data);
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetchNowPlayingMovies : $e');
    }
  }

  @override
  Future<MovieResponseDto?> fetchPopularMovies() async {
    try {
      final response = await _client.get('/popular', queryParameters: {
        'language': 'ko-KR',
        'page': 1,
      });
      if (response.statusCode == 200) {
        // 응답 데이터에서 MovieDto 목록으로 변환
        return MovieResponseDto.fromJson(response.data);
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetchPopularMovies : $e');
    }
  }

  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() async {
    try {
      final response = await _client.get('/top_rated', queryParameters: {
        'language': 'ko-KR',
        'page': 1,
      });
      if (response.statusCode == 200) {
        // 응답 데이터에서 MovieDto 목록으로 변환
        return MovieResponseDto.fromJson(response.data);
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetchTopRatedMovies : $e');
    }
  }

  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() async {
    try {
      final response = await _client.get('/upcoming', queryParameters: {
        'language': 'ko-KR',
        'page': 1,
      });
      if (response.statusCode == 200) {
        // 응답 데이터에서 MovieDto 목록으로 변환
        return MovieResponseDto.fromJson(response.data);
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetchUpcomingMovies : $e');
    }
  }

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    try {
      final response = await _client.get('/$id', queryParameters: {
        'language': 'ko-KR',
      });
      if (response.statusCode == 200) {
        // 응답 데이터에서 MovieDto 목록으로 변환
        return MovieDetailDto.fromJson(response.data);
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetchMovieDetail : $e');
    }
  }
}
