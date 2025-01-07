import 'package:flutter_movie_app/domain/entity/movie_entity.dart';
import 'package:flutter_movie_app/presentation/%08providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieState {
  final List<MovieEntity>? nowPlayingMovies;
  final List<MovieEntity>? popularMovies;
  final List<MovieEntity>? topRatedMovies;
  final List<MovieEntity>? upcomingMovies;
  final MovieEntity? mostPopular;

  MovieState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.upcomingMovies = const [],
    this.mostPopular,
  });

  MovieState copyWith({
    MovieEntity? mostPopular,
    List<MovieEntity>? nowPlayingMovies,
    List<MovieEntity>? popularMovies,
    List<MovieEntity>? topRatedMovies,
    List<MovieEntity>? upcomingMovies,
  }) {
    return MovieState(
      mostPopular: mostPopular ?? this.mostPopular,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
    );
  }
}

class MovieListViewModel extends Notifier<MovieState> {
  @override
  MovieState build() {
    fetchAll();
    return MovieState(
      mostPopular: null,
      nowPlayingMovies: null,
      popularMovies: null,
      topRatedMovies: null,
      upcomingMovies: null,
    );
  }

  Future<void> fetchAll() async {
    await Future.wait([
      fetchNowPlayingMovies(),
      fetchPopularMovies(),
      fetchTopRatedMovies(),
      fetchUpcomingMovies(),
    ]);
  }

  // 비동기 함수로 movies를 로드하고 상태 업데이트
  Future<void> fetchNowPlayingMovies() async {
    final result =
        await ref.read(fetchNowPlayingMoviesUsecaseProvider).execute();
    state = state.copyWith(
      nowPlayingMovies: result ?? [],
    );
  }

  Future<void> fetchPopularMovies() async {
    final result = await ref.read(fetchPopularMoviesUsecaseProvider).execute();
    state = state.copyWith(
      mostPopular: result?.first,
      popularMovies: result ?? [],
    );
  }

  Future<void> fetchTopRatedMovies() async {
    final result = await ref.read(fetchTopRatedMoviesUsecaseProvider).execute();
    state = state.copyWith(
      topRatedMovies: result ?? [],
    );
  }

  Future<void> fetchUpcomingMovies() async {
    final result = await ref.read(fetchUpcomingMoviesUsecaseProvider).execute();
    state = state.copyWith(
      upcomingMovies: result ?? [],
    );
  }
}

final movieListViewModelProvider =
    NotifierProvider<MovieListViewModel, MovieState>(
        () => MovieListViewModel());
