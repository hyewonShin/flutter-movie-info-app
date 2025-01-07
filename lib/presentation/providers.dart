import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_movie_detail_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_top_rated_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_upcoming_movies_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// viewModel에서 직접 객체 생성하지 않을 수 있게 UserCase 공급해주는 Provider 생성
// ViewModel 내에서는 Provider에 의해서 UseCase 공급받음!

final _movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return MovieDataSourceImpl(Dio(BaseOptions(
    validateStatus: (status) => true,
  )));
});

final _movieRepositoryProvider = Provider<MovieRepository>(
  (ref) {
    final dataSource = ref.read(_movieDataSourceProvider);
    return MovieRepositoryImpl(dataSource);
  },
);

final fetchMovieDetailUsecaseProvider = Provider<FetchMovieDetailUsecase>(
  (ref) => FetchMovieDetailUsecase(ref.read(_movieRepositoryProvider)),
);

final fetchNowPlayingMoviesUsecaseProvider =
    Provider<FetchNowPlayingMoviesUsecase>(
  (ref) => FetchNowPlayingMoviesUsecase(ref.read(_movieRepositoryProvider)),
);

final fetchPopularMoviesUsecaseProvider = Provider<FetchPopularMoviesUsecase>(
  (ref) => FetchPopularMoviesUsecase(ref.read(_movieRepositoryProvider)),
);

final fetchTopRatedMoviesUsecaseProvider = Provider<FetchTopRatedMoviesUsecase>(
  (ref) => FetchTopRatedMoviesUsecase(ref.read(_movieRepositoryProvider)),
);

final fetchUpcomingMoviesUsecaseProvider = Provider<FetchUpcomingMoviesUsecase>(
  (ref) => FetchUpcomingMoviesUsecase(ref.read(_movieRepositoryProvider)),
);
