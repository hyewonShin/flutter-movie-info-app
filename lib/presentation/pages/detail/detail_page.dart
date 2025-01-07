import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail/detail_page_view_model.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widget/box_office_data.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widget/movie_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final int id;
  final String imgUrl;
  final String heroTagPrefix;

  const DetailPage({
    super.key,
    required this.id,
    required this.imgUrl,
    required this.heroTagPrefix,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailMovieData = ref.watch(detailPageViewModel(id));
    final heroTag = '${heroTagPrefix}_${id}';

    // 상태가 초기값일 경우 로딩 인디케이터 표시
    if (detailMovieData == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          Hero(
            tag: heroTag,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Image.network('https://image.tmdb.org/t/p/w500' +
                  detailMovieData.posterPath),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      detailMovieData.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(detailMovieData.releaseDate.toString().split(' ')[0]),
                  ],
                ),
                Text(detailMovieData.originalTitle),
                Text('${detailMovieData.runtime.toString()}분'),
                Divider(),
                SizedBox(height: 3),
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: (detailMovieData.genres).length,
                    itemBuilder: (context, index) {
                      final genre = detailMovieData.genres[index];
                      return MovieCategory(genre); // Genre 객체에서 name을 사용
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                  ),
                ),
                SizedBox(height: 3),
                Divider(),
                SizedBox(height: 5),
                Text(detailMovieData.overview),
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 8),
                Text(
                  '흥행정보',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      BoxOfficeData('평점', detailMovieData.voteAverage),
                      BoxOfficeData('평점투표수', detailMovieData.voteCount),
                      BoxOfficeData('인기점수', detailMovieData.popularity),
                      BoxOfficeData('예산', '\$${detailMovieData.budget}'),
                      BoxOfficeData('수익', detailMovieData.revenue),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: detailMovieData.productionCompanyLogos.length,
                    itemBuilder: (context, index) {
                      final companyLogos =
                          detailMovieData.productionCompanyLogos[index];
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.white),
                            height: 100,
                            width: 160,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    'https://image.tmdb.org/t/p/w500' +
                                        companyLogos),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
