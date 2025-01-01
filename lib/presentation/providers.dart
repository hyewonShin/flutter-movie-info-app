// viewModel에서 직접 객체 생성하지 않을 수 있게
// UserCase 공급해주는 Provider 생성
// ViewModel 내에서는 Provider에 의해서 UseCase 공급받음!

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_movies_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/movie',
      headers: {
        'Authorization': dotenv.get('THEMOVIEDB_TOKEN'),
      },
    ),
  );
});

final _movieDataSoureceProvider = Provider<MovieDataSource>((ref) {
  final dio = ref.read(_dioProvider); // Dio 객체 읽기
  return MovieAssetDataSourceImpl(dio); // Dio 전달
});

final _movieRepositoryProvider = Provider<MovieRepository>(
  (ref) {
    final dataSource = ref.read(_movieDataSoureceProvider);
    return MovieRepositoryImpl(dataSource);
  },
);

final fetchMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchMoviesUsecase(movieRepo);
});
