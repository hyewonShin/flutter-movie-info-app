import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Title('가장 인기있는'),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network('https://picsum.photos/400/570')),
          Title('현재 상영중'),
          ImageBox(),
          Title('인기순'),
          ImageBox(),
          Title('평점 높은순'),
          ImageBox(),
          Title('개봉예정'),
          ImageBox(),
        ]),
      ),
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

  SizedBox ImageBox() {
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

  Container Images() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network('https://picsum.photos/280/380')));
  }
}
