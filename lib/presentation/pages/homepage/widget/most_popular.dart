import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detailpage/detail_page.dart';

Padding MostPopular(
    BuildContext context, int topRankingId, String topRankingPoster) {
  return Padding(
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500' + topRankingPoster,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
