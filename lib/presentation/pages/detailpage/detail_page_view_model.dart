import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/presentation/%08providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPageViewModel extends AutoDisposeFamilyNotifier<MovieDetail?, int> {
  @override
  MovieDetail? build(int arg) {
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

final detailPageViewModel =
    NotifierProvider.autoDispose.family<DetailPageViewModel, MovieDetail?, int>(
  () => DetailPageViewModel(),
);
