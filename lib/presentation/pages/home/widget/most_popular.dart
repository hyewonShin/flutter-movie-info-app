import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie_entity.dart';
import 'package:flutter_movie_app/presentation/pages/detailpage/detail_page.dart';

Padding MostPopular(
    {required BuildContext context,
    required MovieEntity movie,
    required String heroTagPrefix}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              id: movie.id,
              heroTagPrefix: heroTagPrefix,
              imgUrl: movie.poster_path,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500' + movie.poster_path,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
