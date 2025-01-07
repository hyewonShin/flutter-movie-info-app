import 'package:flutter_movie_app/data/dto/movie_detail_dto/genre.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto/production_company.dart';

class MovieDetailDto {
  // 고유 아이디
  int id;
  // 영화 제목
  String title;
  // 영화 원제목
  String originalTitle;
  // 예산
  int budget;
  // 장르
  List<Genre> genres;
  // 개요
  String overview;
  // 대중성 지수
  double popularity;
  // 포스터 url
  String posterPath;
  // 제작사
  List<ProductionCompany> productionCompanies;
  // 개봉일
  DateTime releaseDate;
  // 수익
  int revenue;
  // 상영시간
  int runtime;
  // 개봉 상태인지
  String status;
  // 평균 점수
  double voteAverage;
  // 투표한 사람의 수
  int voteCount;

  MovieDetailDto({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.budget,
    required this.genres,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.voteAverage,
    required this.voteCount,
  });

  // fromJson
  factory MovieDetailDto.fromJson(Map<String, dynamic> json) {
    return MovieDetailDto(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      budget: json['budget'],
      genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      overview: json['overview'],
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      posterPath: json['poster_path'],
      productionCompanies: json["production_company"] == null
          ? []
          : List<ProductionCompany>.from(json["production_company"]
              .map((x) => ProductionCompany.fromJson(x))),
      releaseDate: DateTime.parse(json['release_date']),
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count'],
    );
  }
}
