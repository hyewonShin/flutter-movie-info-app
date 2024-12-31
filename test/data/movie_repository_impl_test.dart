import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_dto.dart';
import 'package:flutter_movie_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock 클래스 정의
class MockMovieDataSource extends Mock implements MovieDataSource {}

void main() {
  late MockMovieDataSource mockMovieDataSource; // Mock된 데이터 소스
  late final MovieRepositoryImpl movieRepositoryImpl;

  // setUp : 각 테스트가 실행되기 전에 공통으로 수행해야 할 초기화 작업을 설정하는 데 사용됩니다.
  setUp(() async {
    // MockMovieDataSource 초기화
    mockMovieDataSource = MockMovieDataSource();

    // MovieRepositoryImpl 초기화 (mockMovieDataSource를 의존성으로 주입)
    movieRepositoryImpl = MovieRepositoryImpl(mockMovieDataSource);
  });
  test(
    'MovieRepositoryImpl test : fetchNowPlayingMovies',
    () async {
      const testId = 1;
      // Mock 데이터를 반환하도록 설정
      when(() => mockMovieDataSource.fetchNowPlayingMovies())
          .thenAnswer((_) async => [
                MovieDto(
                  id: testId,
                  poster_path: 'poster_path',
                )
              ]);

      // fetchMovies 호출
      final result = await movieRepositoryImpl.fetchNowPlayingMovies();

      // 결과 검증
      expect(result.length, 1); // 반환된 데이터 길이 확인
      expect(result[0].poster_path, 'poster_path'); // 첫 번째 데이터의 poster_path 확인
    },
  );
}
