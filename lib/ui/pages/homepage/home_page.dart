import 'package:flutter/material.dart';
import 'package:flutter_movie_app/ui/pages/detailpage/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title('가장 인기있는'),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailPage()));
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network('https://picsum.photos/600/800'))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title('현재 상영중'),
              ImageBoxList(),
              Title('인기순'),
              PopularImageList(),
              Title('평점 높은순'),
              ImageBoxList(),
              Title('개봉예정'),
              ImageBoxList(),
            ],
          ),
        )
      ]),
    );
  }

  Padding Title(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  SizedBox ImageBoxList() {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Images(),
          Images(),
          Images(),
          Images(),
          Images(),
        ],
      ),
    );
  }

  Container PopularImageList() {
    return Container(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          PopularStackImages('1'),
          PopularStackImages('2'),
          PopularStackImages('3'),
          PopularStackImages('4'),
          PopularStackImages('5'),
        ],
      ),
    );
  }

  Stack PopularStackImages(String num) {
    return Stack(children: [
      Container(
        width: 160,
        child: Align(
          alignment: Alignment.centerRight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000088/88381/88381231558_727.jpg',
            ),
          ),
        ),
      ),
      Positioned(
        top: 60,
        child: Text(
          num,
          style: TextStyle(
            fontSize: 100,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ]);
  }

  Container Images() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network('https://picsum.photos/280/380')));
  }
}
