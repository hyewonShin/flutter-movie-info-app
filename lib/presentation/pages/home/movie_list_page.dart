import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/homepage/movie_list_view_model.dart';
import 'package:flutter_movie_app/presentation/pages/homepage/widget/image_box_list.dart';
import 'package:flutter_movie_app/presentation/pages/homepage/widget/most_popular.dart';
import 'package:flutter_movie_app/presentation/pages/homepage/widget/popular_image_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 영화 데이터 읽기
    final state = ref.watch(movieListViewModelProvider);

    // 상태가 null 경우 로딩 인디케이터 표시
    if (state.mostPopular == null &&
        state.nowPlayingMovies == null &&
        state.popularMovies == null &&
        state.topRatedMovies == null &&
        state.upcomingMovies == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // ListView.builder를 사용하여 영화 리스트 렌더링
    return Scaffold(
      body: ListView.builder(
        itemCount: 1, // 영화 데이터의 길이를 아이템 개수로 설정
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title('가장 인기있는'),
                  if (state.mostPopular != null)
                    MostPopular(
                      context: context,
                      movie: state.mostPopular!,
                      heroTagPrefix: 'MOST_POPULAR',
                    ),
                  Title('현재 상영중'),
                  ImageBoxList(
                      context: context,
                      movies: state.nowPlayingMovies ?? [],
                      heroTagPrefix: "NOW_PLAYING"),
                  Title('인기순'),
                  PopularImageList(
                      context: context,
                      movies: state.popularMovies ?? [],
                      heroTagPrefix: "POPULAR"),
                  Title('평점 높은순'),
                  ImageBoxList(
                      context: context,
                      movies: state.topRatedMovies ?? [],
                      heroTagPrefix: "TOP_RATED"),
                  Title('개봉예정'),
                  ImageBoxList(
                      context: context,
                      movies: state.upcomingMovies ?? [],
                      heroTagPrefix: "UPCOMING"),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

Padding Title(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}
