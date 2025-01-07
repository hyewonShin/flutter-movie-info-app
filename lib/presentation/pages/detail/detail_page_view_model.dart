import 'package:flutter_movie_app/domain/entity/movie_detail_entity.dart';
import 'package:flutter_movie_app/presentation/%08providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPageViewModel
    extends AutoDisposeFamilyNotifier<MovieDetailEntity?, int> {
  @override
  MovieDetailEntity? build(int arg) {
    fetchMovieDetail();
    return null;
  }

  Future<void> fetchMovieDetail() async {
    state = await ref.read(fetchMovieDetailUsecaseProvider).execute(arg);
  }
}

final detailPageViewModel = NotifierProvider.autoDispose
    .family<DetailPageViewModel, MovieDetailEntity?, int>(
  () => DetailPageViewModel(),
);
