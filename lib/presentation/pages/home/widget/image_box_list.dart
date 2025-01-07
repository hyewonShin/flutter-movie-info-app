import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie_entity.dart';
import 'package:flutter_movie_app/presentation/pages/detail/detail_page.dart';

Widget ImageBoxList(
    {required context,
    required List<MovieEntity> movies,
    required heroTagPrefix}) {
  return SizedBox(
    height: 180,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: movies.map((movie) {
        // 각 영화의 포스터 경로를 사용하여 이미지 표시
        String imageUrl = 'https://image.tmdb.org/t/p/w500' + movie.poster_path;
        return Images(
            context: context,
            posterPath: imageUrl,
            id: movie.id,
            heroTagPrefix: heroTagPrefix);
      }).toList(),
    ),
  );
}

Widget Images(
    {required context,
    required String posterPath,
    required int id,
    required heroTagPrefix}) {
  final heroTag = '${heroTagPrefix}_${id}';
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            id: id,
            imgUrl: posterPath,
            heroTagPrefix: heroTagPrefix,
          ),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Hero(
            tag: heroTag,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(posterPath)),
          )),
    ),
  );
}
