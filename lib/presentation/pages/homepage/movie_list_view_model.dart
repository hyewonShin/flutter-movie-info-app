import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/%08providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieListViewModel extends Notifier<List<Movie>?> {
  @override
  List<Movie>? build() {
    fetchMovies();
    return null;
  }

  // 비동기 함수로 movies를 로드하고 상태 업데이트
  Future<void> fetchMovies() async {
    try {
      final movies = await ref.read(fetchMoviesUsecaseProvider).execute();
      state = movies; // 성공적으로 데이터를 받아오면 state 업데이트
    } catch (e) {
      state = []; // 실패 시 빈 리스트로 처리
    }
  }
}

final movieListViewModelProvider =
    NotifierProvider<MovieListViewModel, List<Movie>?>(
        () => MovieListViewModel());
