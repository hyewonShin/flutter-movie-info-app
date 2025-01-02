import 'package:flutter/material.dart';

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
