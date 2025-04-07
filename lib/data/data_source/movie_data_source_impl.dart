import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto/movie_response_dto.dart';

// 주삭 추가 //
class MovieDataSourceImpl implements MovieDataSource {
  MovieDataSourceImpl(this._dioClient) {
    _dioClient.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (options.uri.host == 'api.themoviedb.org') {
          options.headers.addAll(
            {
              "Authorization": 'Bearer' + dotenv.get('THEMOVIEDB_TOKEN'),
              'accept': 'application/json',
            },
          );
        }
        handler.next(options);
      },
    ));
  }

  final Dio _dioClient;
  final String _baseUrl = 'https://api.themoviedb.org/3/movie';
  final _commonQueryParam = {
    'language': 'ko-KR',
    'page': 1,
  };

  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    try {
      final response = await _dioClient.get(
        '$_baseUrl/now_playing',
        queryParameters: _commonQueryParam,
      );
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
      final response = await _dioClient.get(
        '$_baseUrl/popular',
        queryParameters: _commonQueryParam,
      );
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
      final response = await _dioClient.get(
        '$_baseUrl/top_rated',
        queryParameters: _commonQueryParam,
      );
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
      final response = await _dioClient.get(
        '$_baseUrl/upcoming',
        queryParameters: _commonQueryParam,
      );
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
      final response = await _dioClient.get(
        '$_baseUrl/$id',
        queryParameters: {'language': 'language=ko-KR'},
      );
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
