import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie_entity.dart';
import 'package:flutter_movie_app/presentation/pages/detail/detail_page.dart';

Container PopularImageList(
    {required context,
    required List<MovieEntity> movies,
    required heroTagPrefix}) {
  return Container(
    height: 180,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return PopularStackImages(
            context: context,
            num: (index + 1).toString(),
            posterPath: 'https://image.tmdb.org/t/p/w500' + movie.poster_path,
            id: movie.id,
            heroTagPrefix: heroTagPrefix);
      },
    ),
  );
}

Widget PopularStackImages(
    {required context,
    required String num,
    required String posterPath,
    required int id,
    required heroTagPrefix}) {
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
    child: Stack(children: [
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
    ]),
  );
}
