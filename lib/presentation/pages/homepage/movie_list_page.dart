import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/detailpage/detail_page.dart';
import 'package:flutter_movie_app/presentation/pages/homepage/movie_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 영화 데이터 읽기
    final state = ref.watch(movieListViewModelProvider);

    // 상태가 초기값일 경우 로딩 인디케이터 표시
    if (state.nowPlayingMovies.isEmpty &&
        state.popularMovies.isEmpty &&
        state.topRatedMovies.isEmpty &&
        state.upcomingMovies.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // 가장 인기있는 영화의 포스터를 가져오기
    // TODO ui로딩 전에 못가져오는 경우 예외처리 해야됌
    String topRankingPoster = state.popularMovies[0].poster_path;
    int topRankingId = state.popularMovies[0].id;
    // ListView.builder를 사용하여 영화 리스트 렌더링
    return Scaffold(
      body: ListView.builder(
        itemCount: 1, // 영화 데이터의 길이를 아이템 개수로 설정
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title('가장 인기있는'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(id: topRankingId),
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'sample-image', // 고유 태그 사용
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500' + topRankingPoster,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // 가장 인기있는 영화 섹션
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title('현재 상영중'),
                  ImageBoxList(context, state.nowPlayingMovies),
                  Title('인기순'),
                  PopularImageList(context, state.popularMovies), // 인기 영화 리스트
                  Title('평점 높은순'),
                  ImageBoxList(context, state.topRatedMovies),
                  Title('개봉예정'),
                  ImageBoxList(context, state.upcomingMovies),
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

Widget ImageBoxList(context, List<Movie> movies) {
  return SizedBox(
    height: 180,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: movies.map((movie) {
        // 각 영화의 포스터 경로를 사용하여 이미지 표시
        String imageUrl = 'https://image.tmdb.org/t/p/w500' + movie.poster_path;
        return Images(context, imageUrl, movie.id);
      }).toList(),
    ),
  );
}

Container PopularImageList(context, List<Movie> movies) {
  return Container(
    height: 180,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return PopularStackImages(
          (index + 1).toString(),
          'https://image.tmdb.org/t/p/w500' + movie.poster_path,
        );
      },
    ),
  );
}

Stack PopularStackImages(String num, String posterPath) {
  return Stack(children: [
    Container(
      width: 160,
      child: Align(
        alignment: Alignment.centerRight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(posterPath),
        ),
      ),
    ),
    Positioned(
      top: 60,
      child: Text(
        num,
        style: TextStyle(
          fontSize: 100,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ]);
}

Widget Images(context, poster_path, id) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(id: id),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(poster_path))),
    ),
  );
}
