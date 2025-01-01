import 'package:flutter_movie_app/domain/movie_state.dart';
import 'package:flutter_movie_app/presentation/%08providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieListViewModel extends Notifier<MovieState> {
  @override
  MovieState build() {
    fetchNowPlayingMovies();
    fetchPopularMovies();
    fetchTopRatedMovies();
    fetchUpcomingMovies();
    return MovieState(); // 초기 상태
  }

  // 비동기 함수로 movies를 로드하고 상태 업데이트
  Future<void> fetchNowPlayingMovies() async {
    try {
      final movies =
          await ref.read(fetchMoviesUsecaseProvider).fetchNowPlayingMovies();
      state = state.copyWith(nowPlayingMovies: movies);
    } catch (e) {
      state = state.copyWith(nowPlayingMovies: []);
    }
  }

  Future<void> fetchPopularMovies() async {
    try {
      final movies =
          await ref.read(fetchMoviesUsecaseProvider).fetchPopularMovies();
      state = state.copyWith(popularMovies: movies);
    } catch (e) {
      state = state.copyWith(popularMovies: []);
    }
  }

  Future<void> fetchTopRatedMovies() async {
    try {
      final movies =
          await ref.read(fetchMoviesUsecaseProvider).fetchTopRatedMovies();
      state = state.copyWith(topRatedMovies: movies);
    } catch (e) {
      state = state.copyWith(topRatedMovies: []);
    }
  }

  Future<void> fetchUpcomingMovies() async {
    try {
      final movies =
          await ref.read(fetchMoviesUsecaseProvider).fetchUpcomingMovies();
      state = state.copyWith(upcomingMovies: movies);
    } catch (e) {
      state = state.copyWith(upcomingMovies: []);
    }
  }
}

final movieListViewModelProvider =
    NotifierProvider<MovieListViewModel, MovieState>(
        () => MovieListViewModel());
