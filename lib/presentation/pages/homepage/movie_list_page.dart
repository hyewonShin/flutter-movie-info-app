import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/detailpage/detail_page.dart';
import 'package:flutter_movie_app/presentation/pages/homepage/movie_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 영화 데이터 읽기
    final movies = ref.watch(movieListViewModelProvider);

    // 영화 데이터가 없으면 로딩 인디케이터 표시
    if (movies == null) {
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
          String baseUrl = "https://image.tmdb.org/t/p/w500";
          final movie = movies[index]; // 각 영화 데이터를 가져옵니다

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 가장 인기있는 영화 섹션
                Title('가장 인기있는'),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(),
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'sample-image', // 고유 태그 사용
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://picsum.photos/280/380',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 영화 카테고리들 (현재 상영중, 인기순 등)
                      Title('현재 상영중'),
                      ImageBoxList(movies), // 상영중 영화 리스트
                      Title('인기순'),
                      PopularImageList(), // 인기 영화 리스트
                      Title('평점 높은순'),
                      ImageBoxList(movies), // 평점 높은 영화 리스트
                      Title('개봉예정'),
                      ImageBoxList(movies), // 개봉 예정 영화 리스트
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Padding Title(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
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

SizedBox ImageBoxList(List<Movie> movies) {
  return SizedBox(
    height: 180,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: movies.map((movie) {
        // 각 영화의 포스터 경로를 사용하여 이미지 표시
        String imageUrl = 'https://image.tmdb.org/t/p/w500' + movie.poster_path;
        return Images(imageUrl);
      }).toList(),
    ),
  );
}

Container PopularImageList() {
  return Container(
    height: 180,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        PopularStackImages('1'),
        PopularStackImages('2'),
        PopularStackImages('3'),
        PopularStackImages('4'),
        PopularStackImages('5'),
      ],
    ),
  );
}

Stack PopularStackImages(String num) {
  return Stack(children: [
    Container(
      width: 160,
      child: Align(
        alignment: Alignment.centerRight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88381/88381231558_727.jpg',
          ),
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

Container Images(poster_path) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:
              Image.network(poster_path ?? 'https://picsum.photos/280/380')));
}
