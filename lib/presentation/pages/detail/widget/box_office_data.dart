import 'package:flutter/material.dart';

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
