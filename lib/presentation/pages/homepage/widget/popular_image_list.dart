import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie_entity.dart';
import 'package:flutter_movie_app/presentation/pages/detailpage/detail_page.dart';

Container PopularImageList(context, List<MovieEntity> movies) {
  return Container(
    height: 180,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return PopularStackImages(context, (index + 1).toString(),
            'https://image.tmdb.org/t/p/w500' + movie.poster_path, movie.id);
      },
    ),
  );
}

Widget PopularStackImages(context, String num, String posterPath, int id) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(id: id),
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
