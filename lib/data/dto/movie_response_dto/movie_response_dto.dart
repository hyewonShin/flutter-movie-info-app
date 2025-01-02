import 'package:flutter_movie_app/data/dto/movie_response_dto/movie_result.dart';

class MovieResponseDto {
  final int page;
  final List<MovieResult> results;
  final int totalPages;
  final int totalResults;

  MovieResponseDto({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  MovieResponseDto.fromJson(Map<String, dynamic> json)
      : this(
          page: json["page"],
          results: List<MovieResult>.from(
              json["results"].map((x) => MovieResult.fromJson(x))),
          totalPages: json["total_pages"],
          totalResults: json["total_results"],
        );
}
