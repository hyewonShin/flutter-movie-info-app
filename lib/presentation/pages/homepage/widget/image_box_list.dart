import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/detailpage/detail_page.dart';

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
          child: Hero(
            tag: 'hero-movie-$id',
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(poster_path)),
          )),
    ),
  );
}
