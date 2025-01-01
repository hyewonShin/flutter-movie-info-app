import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_movies_usecase.dart';
import 'package:flutter_movie_app/presentation/%08providers.dart';
import 'package:flutter_movie_app/presentation/pages/homepage/movie_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFetchMoviesUsecase extends Mock implements FetchMoviesUsecase {}

void main() {
  late final ProviderContainer providerContainer;

  setUp(
    () async {
      final fetchMoviesUsecaseProviderOverride =
          fetchMoviesUsecaseProvider.overrideWith(
        (ref) => MockFetchMoviesUsecase(),
      );
      providerContainer = ProviderContainer(overrides: [
        fetchMoviesUsecaseProviderOverride,
      ]);
      addTearDown(providerContainer.dispose);
    },
  );

  test(
    'MovieListViewModel test : state update after fetchMovies',
    () async {
      const testId = 1; // Example test id value
      final fetchMoviesUseCase =
          providerContainer.read(fetchMoviesUsecaseProvider);
      when(() => fetchMoviesUseCase.fetchNowPlayingMovies())
          .thenAnswer((_) async => [
                Movie(
                  id: testId,
                  poster_path: 'poster_path',
                )
              ]);

      final stateBefore = providerContainer.read(movieListViewModelProvider);
      expect(stateBefore, isNull);
      await providerContainer
          .read(movieListViewModelProvider.notifier)
          .fetchNowPlayingMovies();

      final stateAfter = providerContainer.read(movieListViewModelProvider);
      expect(stateAfter, isNotNull);
    },
  );
}
