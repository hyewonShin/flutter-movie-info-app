import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detailpage/detail_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final int id;

  const DetailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailMovieData = ref.watch(detailPageViewModel(id));
    print('detailMovieData > ${detailMovieData?.toJson()}');

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
            tag: 'sample-image',
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
                      final category =
                          detailMovieData.genres[index]; // null 안전하게 접근
                      return MovieCategory(
                          category.name); // Genre 객체에서 name을 사용
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
                    itemCount: detailMovieData.productionCompanies.length,
                    itemBuilder: (context, index) {
                      final company =
                          detailMovieData.productionCompanies[index];
                      return Column(
                        children: [
                          company.logoPath.isNotEmpty
                              ? Container(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  height: 100,
                                  width: 160,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                          'https://image.tmdb.org/t/p/w500' +
                                              company.logoPath),
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  height: 100,
                                  width: 160,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Center(
                                          child: Text(
                                            '${company.name}',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        )),
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

  Container MovieCategory(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white)),
      child: Text(
        text,
        style: TextStyle(color: Colors.blue),
      ),
    );
  }

  Widget BoxOfficeData(String text, dynamic value) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white)),
          child: Column(
            children: [
              Text(
                value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
