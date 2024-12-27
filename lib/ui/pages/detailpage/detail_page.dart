import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Animation',
      'Drama',
      'Action',
      'Comedy',
      'Horror',
      'Sci-Fi',
      'Thriller',
      'Fantasy',
      'Adventure',
      'Romance'
    ];

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
              child: Image.network(
                  'https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88381/88381231558_727.jpg'),
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
                      '영화명',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('2024-12-27'),
                  ],
                ),
                Text('영화 서브명/The ocean is calling them back.'),
                Text('상영시간/100분'),
                Divider(),
                SizedBox(height: 3),
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return MovieCategory(category);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 5,
                      );
                    },
                  ),
                ),
                SizedBox(height: 3),
                Divider(),
                SizedBox(height: 5),
                Text(
                    '영화 설명/t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters'),
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
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return BoxOfficeData('6.949 \n 평점');
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 70,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(color: Colors.white),
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

  Container BoxOfficeData(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
