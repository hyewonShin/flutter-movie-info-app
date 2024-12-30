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
  // 개요(영화 설명?)
  String overview;
  // 대중성 지수?
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
      genres: (json['genres'] as List)
          .map((genreJson) => Genre.fromJson(genreJson))
          .toList(),
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      productionCompanies: (json['production_companies'] as List)
          .map((companyJson) => ProductionCompany.fromJson(companyJson))
          .toList(),
      releaseDate: DateTime.parse(json['release_date']),
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'originalTitle': originalTitle,
      'budget': budget,
      'genres': genres.map((genre) => genre.toJson()).toList(),
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies':
          productionCompanies.map((company) => company.toJson()).toList(),
      'release_date': releaseDate.toIso8601String(),
      'revenue': revenue,
      'runtime': runtime,
      'status': status,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  // fromJson
  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class ProductionCompany {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  // fromJson
  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'],
      logoPath: json['logo_path'] ?? '', // logo_path가 없을 수 있음
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }
}
