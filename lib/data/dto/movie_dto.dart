class MovieDto {
  final int id;
  final String poster_path;

  MovieDto({
    required this.id,
    required this.poster_path,
  });

  MovieDto copyWith({
    int? id,
    String? poster_path,
  }) =>
      MovieDto(
        id: id ?? this.id,
        poster_path: poster_path ?? this.poster_path,
      );

  MovieDto.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          poster_path: json["poster_path"],
        );

  Map<String, dynamic> toJson() => {
        "id": id,
        "poster_path": poster_path,
      };
}
