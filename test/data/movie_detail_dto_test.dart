import 'dart:convert';

import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'MovieDetailDto : fromJson test',
    () {
      const sampleJsonString = """
    {
      "adult": false,
      "backdrop_path": "/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg",
      "belongs_to_collection": {
        "id": 558216,
        "name": "베놈 시리즈",
        "poster_path": "/aC1yeoBdQL0fukiKrEAFocJ572O.jpg",
        "backdrop_path": "/vq340s8DxA5Q209FT8PHA6CXYOx.jpg"
      },
      "budget": 120000000,
      "genres": [
        {
          "id": 28,
          "name": "액션"
        },
        {
          "id": 878,
          "name": "SF"
        },
        {
          "id": 12,
          "name": "모험"
        },
        {
          "id": 53,
          "name": "스릴러"
        }
      ],
      "homepage": "",
      "id": 912649,
      "imdb_id": "tt16366836",
      "origin_country": [
        "US"
      ],
      "original_language": "en",
      "original_title": "Venom: The Last Dance",
      "overview": "환상의 케미스트리의 에디 브록과 그의 심비오트 베놈은 그들을 노리는 정체불명 존재의 추격을 피해 같이 도망을 다니게 된다. 한편 베놈의 창조자 널은 고향 행성에서부터 그들을 찾아내기 위해 지구를 침략하고 에디와 베놈은 그동안 겪어보지 못한 최악의 위기를 맞이하게 되는데…",
      "popularity": 3569.507,
      "poster_path": "/rajTvnpDKRupZPpKJRxeJMKrIs6.jpg",
      "production_companies": [
        {
          "id": 5,
          "logo_path": "/71BqEFAF4V3qjjMPCpLuyJFB9A.png",
          "name": "Columbia Pictures",
          "origin_country": "US"
        },
        {
          "id": 84041,
          "logo_path": "/nw4kyc29QRpNtFbdsBHkRSFavvt.png",
          "name": "Pascal Pictures",
          "origin_country": "US"
        },
        {
          "id": 53462,
          "logo_path": "/nx8B3Phlcse02w86RW4CJqzCnfL.png",
          "name": "Matt Tolmach Productions",
          "origin_country": "US"
        },
        {
          "id": 91797,
          "logo_path": null,
          "name": "Hutch Parker Entertainment",
          "origin_country": "US"
        },
        {
          "id": 14439,
          "logo_path": null,
          "name": "Arad Productions",
          "origin_country": "US"
        }
      ],
      "production_countries": [
        {
          "iso_3166_1": "US",
          "name": "United States of America"
        }
      ],
      "release_date": "2024-10-22",
      "revenue": 476391878,
      "runtime": 109,
      "spoken_languages": [
        {
          "english_name": "English",
          "iso_639_1": "en",
          "name": "English"
        }
      ],
      "status": "Released",
      "tagline": "죽음이 갈라놓을 때까지",
      "title": "베놈: 라스트 댄스",
      "video": false,
      "vote_average": 6.806,
      "vote_count": 1988
    }
""";
      final movie = MovieDetailDto.fromJson(jsonDecode(sampleJsonString));

      expect(movie, isNot(null));
      expect(movie.id, 912649);
      expect(movie.title, '베놈: 라스트 댄스');
      expect(movie.voteAverage, 6.806);
    },
  );
}
