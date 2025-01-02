class MovieDetailEntity {
  // 고유 아이디
  int id;
  // 영화 제목
  String title;
  // 영화 원제목
  String originalTitle;
  // // 예산
  int budget;
  // 장르
  List<String> genres;
  // 개요(영화 설명?)
  String overview;
  // 대중성 지수
  double popularity;
  // 포스터 url
  String posterPath;
  // 제작사
  List<String> productionCompanyLogos;
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

  MovieDetailEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.budget,
    required this.genres,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanyLogos,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.voteAverage,
    required this.voteCount,
  });
}
