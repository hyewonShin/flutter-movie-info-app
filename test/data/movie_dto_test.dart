import 'dart:convert';

import 'package:flutter_movie_app/data/dto/movie_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'MovieDto : fromJson test',
    () {
      const sampleJsonString = """
 {
      "adult": false,
      "backdrop_path": "/dWkdmxIkH9y23s9v1PjQFhTGIwo.jpg",
      "genre_ids": [
        28,
        18,
        53
      ],
      "id": 1043905,
      "original_language": "en",
      "original_title": "Dirty Angels",
      "overview": "2021년 미국의 아프가니스탄 철군 당시, 의료 구호 팀으로 위장한 여성 군인들이 납치된 십대 소년·소녀들을 구출하기 위해 다시 투입된다. 이들은 ISIS와 탈레반 사이에 갇힌 피해자들을 구출하는 임무를 맡는다.",
      "popularity": 2050.799,
      "poster_path": "/3O3qSGmjRGc10hMwFul8WDxKE5t.jpg",
      "release_date": "2024-12-11",
      "title": "더티 엔젤스",
      "video": false,
      "vote_average": 6.7,
      "vote_count": 58
    }
""";
      final movie = MovieDto.fromJson(jsonDecode(sampleJsonString));
      expect(movie.poster_path, "/3O3qSGmjRGc10hMwFul8WDxKE5t.jpg");
    },
  );
}
