import 'package:flutter_movie_app/domain/entity/movie_detail_entity.dart';
import 'package:flutter_movie_app/presentation/%08providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPageViewModel
    extends AutoDisposeFamilyNotifier<MovieDetailEntity?, int> {
  @override
  MovieDetailEntity? build(int arg) {
    fetchMovieDetail(arg);
    return null;
  }

  Future<void> fetchMovieDetail(id) async {
    try {
      final movieDetail =
          await ref.read(fetchMoviesUsecaseProvider).fetchMovieDetail(id);

      if (movieDetail != null) {
        state = movieDetail;
      } else {
        state = null;
      }
    } catch (e) {
      print('❌ Error: $e');
      state = null;
    }
  }
}

final detailPageViewModel = NotifierProvider.autoDispose
    .family<DetailPageViewModel, MovieDetailEntity?, int>(
  () => DetailPageViewModel(),
);
