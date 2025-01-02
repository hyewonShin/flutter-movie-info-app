import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';

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
