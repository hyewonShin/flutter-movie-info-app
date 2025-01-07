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
}
