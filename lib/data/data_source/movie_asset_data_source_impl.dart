import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_dto.dart';

class MovieAssetDataSourceImpl implements MovieDataSource {
  // BaseRemoteRepository에서 제공하는 client getter를 통해 Dio를 가져와 사용
  final Dio _client;

  MovieAssetDataSourceImpl(Dio client) : _client = client;

  Future<List<MovieDto>> fetchMovies() async {
    try {
      final response = await _client.get('movie/now_playing', queryParameters: {
        'language': 'ko-KR',
        'page': 1,
      });
      print('😀 response >> $response');
      if (response.statusCode == 200) {
        // 응답 데이터에서 MovieDto 목록으로 변환
        return (response.data['results'] as List)
            .map((movie) => MovieDto.fromJson(movie))
            .toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }
}
