import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late final Dio dio;
  late final MovieAssetDataSourceImpl movieAssetDataSourceImpl;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl:
          'https://api.themoviedb.org/3/movie/upcoming?language=ko-KR&page=1',
      headers: {
        'Authorization': dotenv.get('THEMOVIEDB_TOKEN'),
      }, // API 키 추가
    ));
    movieAssetDataSourceImpl = MovieAssetDataSourceImpl(dio);
  });

  test(
    'MovieAssetDataSourceImpl: fetchNowPlayingMovies return actual data from API',
    () async {
      // 실제 API 호출
      final result = await movieAssetDataSourceImpl.fetchNowPlayingMovies();

      // 응답 검증
      expect(result, isNotEmpty); // 데이터가 비어있지 않음
    },
  );
}
