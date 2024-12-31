import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_app/data/data_source/movie_asset_data_source_impl.dart';
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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NGE4YWQyMjg0ZTM5NWY3M2E0ZGEyYjE0MzY3MmY1NSIsIm5iZiI6MTczNTI4MTk0Ni4wMDgsInN1YiI6IjY3NmU0ZDE5MmM5MDk3YjI2NjYxNTMyNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tXdQZV26seUtK52ZCCC3F6-10Yi2fOZCfrCXj4ITGJs',
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
