import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late final MockMovieRepository mockMovieRepository;
  late final FetchMoviesUsecase fetchMoviesUsecase;
  setUp(
    () async {
      mockMovieRepository = MockMovieRepository();
      fetchMoviesUsecase = FetchMoviesUsecase(mockMovieRepository);
    },
  );

  test(
    'FetchMoviesUsecase test : fetchNowPlayingMovies',
    () async {
      const testId = 1;
      when(() => mockMovieRepository.fetchNowPlayingMovies())
          .thenAnswer((_) async => [
                Movie(
                  id: testId,
                  poster_path: 'poster_path',
                )
              ]);

      final result = await fetchMoviesUsecase.execute();
      expect(result.length, 1);
      expect(result[0].id, 'id');
    },
  );
}
